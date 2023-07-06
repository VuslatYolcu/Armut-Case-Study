//
//  ServicesViewController.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

protocol ServicesPresenterOutput: AnyObject {
    func presenter(didRetrieveItem item: String)
    func presenter(didFailRetrieveItem message: String)
}

final class ServicesViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = servicesView
        //title = "Hizmet piş ağzıma düş"
        
        
        
        
        
        self.interactor?.viewDidLoad()
        /// I want to call configurator from router but I could not find a way to call configureModule from UITabBarItem.
        ServicesConfigurator.configureModule(viewController: self)
        self.tabBarController?.navigationItem.titleView?.removeFromSuperview()
        self.tabBarController?.navigationItem.title?.removeAll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Properties
    var servicesView: ServicesView?
    var interactor: ServicesInteractor?
    weak var presenter: ServicesPresenter?
    var router: ServicesRouter?
    
}

// MARK: - Presenter Output
extension ServicesViewController: ServicesPresenterOutput {
    func presenter(didRetrieveItem item: String) {
        //titleDetailView?.updateLabel(with: item)
    }

    func presenter(didFailRetrieveItem message: String) {
        //showError(with: message)
    }
}
