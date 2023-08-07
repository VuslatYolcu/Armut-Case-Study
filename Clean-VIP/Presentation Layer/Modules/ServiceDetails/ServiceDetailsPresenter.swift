//
//  ServiceDetailsPresenter.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation
import UIKit

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
        
        let proCountString = String(describing: proCount)
        let formattedProCount = proCountString.formatString(input: proCountString)
        
        let completedJobsString = String(describing: completedJobs)
        let formattedCompletedJobs = proCountString.formatString(input: completedJobsString)
        
        let professionalsViewModel = createInfoViewModel(type: .professionals, label: formattedProCount)
        let ratingViewModel = createInfoViewModel(type: .rating, label: String(describing: rating))
        let completedJobsViewModel = createInfoViewModel(type: .completedJobs, label: formattedCompletedJobs)
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
        let editedLabel = attributedStringWithColor(input: infoLabel, coloredText: label ?? "", color: UIColor.systemGreen)
        let viewModel = ServiceDetailsInfoViewModel(label: editedLabel.string, attributedString: editedLabel,  imageName: type.info.imageName)
        return viewModel
    }
    
    private func editText() {
        
    }
}

extension ServiceDetailsPresenter {
    func attributedStringWithColor(input: String, coloredText: String, color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: input)
        
        // Find the range of the coloredText in the input string
        let range = (input as NSString).range(of: coloredText)
        
        // Apply the color attribute to the range
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        return attributedString
    }
}
