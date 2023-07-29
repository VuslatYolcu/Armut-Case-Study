//
//  NotificationsConfigurator.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 29.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class NotificationsConfigurator {
    
    static func configureModule(viewController: NotificationsViewController) {
        let view = NotificationsView()
        let router = NotificationsRouterImplementation()
        let interactor = NotificationsInteractorImplementation()
        let presenter = NotificationsPresenterImplementation()
        
        viewController.titlesView = view
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}
