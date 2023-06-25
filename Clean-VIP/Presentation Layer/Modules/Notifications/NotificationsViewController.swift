//
//  NotificationsViewController.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

protocol NotificationsPresenterOutput: AnyObject {
    func presenter(didRetrieveItem item: String)
    func presenter(didFailRetrieveItem message: String)
}

final class NotificationsViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = titleDetailView
        self.interactor?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Properties
    var titleDetailView: TitleDetailView?
    var interactor: TitleDetailInteractor?
    weak var presenter: TitleDetailPresenter?
    var router: TitleDetailRouter?
    
}
