//
//  ServicesPresenter.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

protocol ServicesPresenter: AnyObject {
    func presentAllServices(allServicesTitle: String, allServicesList: [AllServicesCollectionViewCellModel])
}

final class ServicesPresenterImplementation: ServicesPresenter {
    var viewController: ServicesPresenterOutput?
    
    // MARK: - Present All Services
    func presentAllServices(allServicesTitle: String, allServicesList: [AllServicesCollectionViewCellModel]) {
        
        let viewModel = AllServicesViewModel(titleLabel: allServicesTitle, serviceList: allServicesList)
        viewController?.presentAllServices(viewModel: viewModel)
        //viewController?.displayFetchedAllServices(viewModel: viewModel)
    }
}
