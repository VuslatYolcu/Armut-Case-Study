//
//  ServicesConfigurator.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 25.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

final class ServicesConfigurator {
    static func configureModule(viewController: ServicesViewController) {
        let view = ServicesView()
        let router = ServicesRouter()
        let interactor = ServicesInteractor()
        let presenter = ServicesPresenter()
        
        viewController.servicesView = view
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
    }
}
