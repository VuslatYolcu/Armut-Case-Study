//
//  ServiceDetailsConfigurator.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

final class ServiceDetailsConfigurator {
    static func configureModule(serviceId: Int?, viewController: ServiceDetailsViewController) {
        let view = ServiceDetailsView()
        let router = ServiceDetailsRouter()
        let interactor = ServiceDetailsInteractor()
        let presenter = ServiceDetailsPresenter()
        
        viewController.serviceDetailsView = view
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        interactor.serviceId = serviceId
        
        presenter.viewController = viewController
        view.delegate = viewController
        
        router.navigationController = viewController.navigationController
    }
}
