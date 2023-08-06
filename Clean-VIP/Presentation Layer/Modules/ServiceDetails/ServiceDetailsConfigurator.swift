//
//  ServiceDetailsConfigurator.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

final class ServiceDetailsConfigurator {
    static func configureModule(viewController: ServiceDetailsViewController) {
        let view = ServiceDetailsView()
        let router = ServiceDetailsRouter()
        let interactor = ServiceDetailsInteractor()
        let presenter = ServiceDetailsPresenter()
        
        viewController.servicesView = view
        viewController.router = router
        viewController.interactor = interactor
        viewController.view = view
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        view.delegate = viewController
        
        router.navigationController = viewController.navigationController
    }
}
