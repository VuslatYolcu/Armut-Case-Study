//
//  NotificationsPresenter.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

protocol NotificationsPresenter: class {
    func interactor(didRetrieveTitles titles: [Title])
    func interactor(didFailRetrieveTitles error: Error)
    
    func interactor(didAddTitle title: Title)
    func interactor(didFailAddTitle error: Error)
    
    func interactor(didDeleteTitleAtIndex index: Int)
    func interactor(didFailDeleteTitleAtIndex index: Int)
    
    func interactor(didFindTitle title: Title)
}

final class NotificationsPresenterImplementation: NotificationsPresenter {
    weak var viewController: NotificationsPresenterOutput?
    
    func interactor(didRetrieveTitles titles: [Title]) {
        let titlesStrings = titles.compactMap { $0.text }
        viewController?.presenter(didRetrieveItems: titlesStrings)
    }
    
    func interactor(didFailRetrieveTitles error: Error) {
        viewController?.presenter(didFailRetrieveItems: error.localizedDescription)
    }
    
    func interactor(didAddTitle title: Title) {
        if let titleString = title.text {
            viewController?.presenter(didAddItem: titleString)
        }
    }
    
    func interactor(didDeleteTitleAtIndex index: Int) {
        viewController?.presenter(didDeleteItemAtIndex: index)
    }
    
    func interactor(didFailDeleteTitleAtIndex index: Int) {
        viewController?.presenter(didFailDeleteItemAtIndex: index, message: "Couldn't delete")
    }
    
    func interactor(didFailAddTitle error: Error) {
        viewController?.presenter(didFailAddItem: error.localizedDescription)
    }
    
    func interactor(didFindTitle title: Title) {
        if let id = title.id {
            viewController?.presenter(didObtainItemId: id)
        }
    }
}

