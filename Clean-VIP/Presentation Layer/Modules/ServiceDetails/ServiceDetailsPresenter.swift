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
    func presentInfoView(model: ServiceDetailsResponseModel)
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
    
    func presentInfoView(model: ServiceDetailsResponseModel) {
        guard let proCount = model.proCount,
              let rating = model.averageRating,
              let completedJobs = model.completedJobsOnLastMonth
        else {
            return
        }
        var infoViewModels = [ServiceDetailsInfoViewModel]()
        
        let professionalsViewModel = createInfoViewModel(type: .professionals, label: String(describing: proCount))
        let ratingViewModel = createInfoViewModel(type: .rating, label: String(describing: rating))
        let completedJobsViewModel = createInfoViewModel(type: .completedJobs, label: String(describing: completedJobs))
        let freeChargeViewModel = createInfoViewModel(type: .freeCharge, label: nil)
        let serviceGuaranteedViewModel = createInfoViewModel(type: .serviceGuaranteed, label: nil)
        
        infoViewModels.append(professionalsViewModel)
        infoViewModels.append(ratingViewModel)
        infoViewModels.append(completedJobsViewModel)
        infoViewModels.append(freeChargeViewModel)
        infoViewModels.append(serviceGuaranteedViewModel)
        viewController?.presentInfoView(viewModels: infoViewModels)
    }
    
    private func createInfoViewModel(type: ServiceDetailsInfoType, label: String?) -> ServiceDetailsInfoViewModel {
        let infoLabel = String(format: type.info.text, label ?? "")
        let viewModel = ServiceDetailsInfoViewModel(label: infoLabel, imageName: type.info.imageName)
        return viewModel
    }
}

