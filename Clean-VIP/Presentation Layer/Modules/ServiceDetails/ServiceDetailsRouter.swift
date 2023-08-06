//
//  ServiceDetailsRouter.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

protocol ServiceDetailsRouterProtocol: AnyObject {
    var navigationController: UINavigationController? { get }
    
    func routeToServiceDetail(with id: String)
}

final class ServiceDetailsRouter: ServiceDetailsRouterProtocol {
    weak var navigationController: UINavigationController?
    
    func routeToServiceDetail(with id: String) {
        let viewController = TitleDetailViewController()
        TitleDetailConfigurator.configureModule(titleId: id,
                                                viewController: viewController)
        
    
        navigationController?.pushViewController(viewController, animated: false)
    }
}


