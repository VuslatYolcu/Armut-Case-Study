//
//  ServicesRouter.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

protocol ServicesRouterProtocol: AnyObject {
    var navigationController: UINavigationController? { get }
    func routeToServiceDetail(with id: Int)
}

final class ServicesRouter: ServicesRouterProtocol {
    weak var navigationController: UINavigationController?
    
    func routeToServiceDetail(with serviceId: Int) {
        let viewController = ServiceDetailsViewController()
        ServiceDetailsConfigurator.configureModule(serviceId: serviceId, viewController: viewController)
        navigationController?.pushViewController(viewController, animated: false)
    }
}
