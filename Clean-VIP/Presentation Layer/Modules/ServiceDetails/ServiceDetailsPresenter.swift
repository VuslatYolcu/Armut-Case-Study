//
//  ServiceDetailsPresenter.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

protocol ServiceDetailsPresenterProtocol: AnyObject {
    func presentHeaderView(titleLabel: String, imageName: String, searchBarPlaceHolder: String)
    func presentServiceDetails(serviceDetail: ServiceDetailsResponseModel)
}

final class ServiceDetailsPresenter: ServiceDetailsPresenterProtocol {
    var viewController: ServiceDetailsPresenterOutput?

    func presentHeaderView(titleLabel: String, imageName: String, searchBarPlaceHolder: String) {
        let headerViewModel = ServicesHeaderViewModel(
            titleLabel: titleLabel,
            imageName: imageName,
            headerBackgroundColor: .systemGray6,
            searchBarPlaceholder: searchBarPlaceHolder,
            searchBarIconColor: .systemGreen
        )
        viewController?.presentHeaderView(viewModel: headerViewModel)
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
}

