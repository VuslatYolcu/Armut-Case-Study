//
//  NotificationsInteractor.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

protocol NotificationsInteractor: class {
    func viewDidLoad()
    func addTapped(with text: String)
    
    func didCommitDelete(for index: Int)
    
    func didSelectRow(at index: Int)
}

final class NotificationsInteractorImplementation: NotificationsInteractor {
    var presenter: NotificationsPresenter?
    
    private let titlesService = TitlesServiceImplementation()
    private var titles: [Title] = []
    
    func viewDidLoad()  {
        do {
            self.titles = try titlesService.getTitles()
            
            presenter?.interactor(didRetrieveTitles: self.titles)
        } catch {
            presenter?.interactor(didFailRetrieveTitles: error)
        }
    }
    
    func addTapped(with text: String) {
        do {
            let title = try titlesService.addTitle(text: text)
            self.titles.append(title)
            
            presenter?.interactor(didAddTitle: title)
        } catch {
            presenter?.interactor(didFailAddTitle: error)
        }
    }
    
    func didCommitDelete(for index: Int) {
        do {
            try titlesService.deleteTitle(with: self.titles[index].id!)
            self.titles.remove(at: index)
            presenter?.interactor(didDeleteTitleAtIndex: index)
        } catch {
            presenter?.interactor(didFailDeleteTitleAtIndex: index)
        }
    }
    
    func didSelectRow(at index: Int) {
        if self.titles.indices.contains(index) {
            presenter?.interactor(didFindTitle: self.titles[index])
        }
    }
}

