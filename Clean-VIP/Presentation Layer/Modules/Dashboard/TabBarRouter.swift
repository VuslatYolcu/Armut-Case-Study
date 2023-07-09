//
//  TabBarRouter.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 25.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

protocol TabBarRouter: AnyObject {
    var navigationController: UINavigationController? { get }
    
    func routeToServices()
    func routeToJobs()
    func routeToNotifications()
    func routeToProfile()
}

final class TabBarRouterImplementation: TabBarRouter {
    weak var navigationController: UINavigationController?
    
    func routeToServices() {
        let viewController = ServicesViewController()
        ServicesConfigurator.configureModule(viewController: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }

    func routeToJobs() {
        let viewController = ServicesViewController()
        ServicesConfigurator.configureModule(viewController: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func routeToNotifications() {
        let viewController = ServicesViewController()
        ServicesConfigurator.configureModule(viewController: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    func routeToProfile() {
        let viewController = ServicesViewController()
        ServicesConfigurator.configureModule(viewController: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
