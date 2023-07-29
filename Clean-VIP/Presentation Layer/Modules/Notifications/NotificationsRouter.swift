//
//  NotificationsRouter.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

protocol NotificationsRouter: class {
    var navigationController: UINavigationController? { get }
    
    func routeToDetail(with id: String)
}

final class NotificationsRouterImplementation: NotificationsRouter {
    weak var navigationController: UINavigationController?
    
    func routeToDetail(with id: String) {
        let viewController = NotificationsViewController()
        NotificationsConfigurator.configureModule(
                                                viewController: viewController)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

