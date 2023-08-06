//
//  ServiceDetailsPresenter.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

protocol ServiceDetailsPresenterProtocol: AnyObject {
    func presentHeaderView(titleLabel: String, imageUrl: String)
    func presentServiceDetails(serviceDetail: ServiceDetailsResponseModel)
    func presentInfoView(label: String, type: ServiceDetailsInfoType)
}

final class ServiceDetailsPresenter: ServiceDetailsPresenterProtocol {
    var viewController: ServiceDetailsPresenterOutput?
    
    func presentHeaderView(titleLabel: String, imageUrl: String) {
        let viewModel = ServiceDetailsHeaderViewModel(title: titleLabel, imageURL: imageUrl)
        viewController?.presentHeaderView(viewModel: viewModel)
    }
   
    func presentServiceDetails(serviceDetail: ServiceDetailsResponseModel) {
        let serviceDetailsViewModel = ServiceDetailsViewModel(
            id: serviceDetail.id,
            serviceID: serviceDetail.serviceID,
            name: serviceDetail.name,
            longName: serviceDetail.longName,
            imageURL: serviceDetail.imageURL,
            proCount: serviceDetail.proCount,
            averageRating: serviceDetail.averageRating,
            completedJobsOnLastMonth: serviceDetail.completedJobsOnLastMonth
        )
        viewController?.displayServiceDetails(viewModel: serviceDetailsViewModel)
    }
    
    func presentInfoView(label: String, type: ServiceDetailsInfoType) {
        let viewModel = ServiceDetailsInfoViewModel(
            label: label,
            type: type
        )
        viewController?.presentInfoView(viewModel: viewModel)
    }
}

