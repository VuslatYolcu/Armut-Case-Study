//
//  ServiceDetailsInteractor.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

protocol ServiceDetailsInteractorProtocol: AnyObject {
    func viewDidLoad()
}

final class ServiceDetailsInteractor {
    
    var serviceId: Int?
    var presenter: ServiceDetailsPresenterProtocol?
    
    private func getServiceDetails(index: Int) {
        guard index < ServiceId.allCases.count else {
            return
        }
        
        let serviceId = ServiceId.allCases[index]
        
        let request = ServiceRequest.init(
            endpoint: .service,
            pathComponents:[serviceId.rawValue],
            queryParameters: []
        )

        ServiceManager.shared.execute(
            request,
            expecting: ServiceDetailsResponseModel.self)
        { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    strongSelf.setHeaderView(model: model)
                    strongSelf.setInfoView(model: model)
                    strongSelf.presenter?.presentServiceDetails(serviceDetail: model)
                    strongSelf.setStepView()
                }
                break
            case .failure(let error):
                strongSelf.presenter?.presentServiceDetailsError(error: error)
                print(error)
                break
            }
        }
    }
    
    private func setHeaderView(model: ServiceDetailsResponseModel) {
        guard let title = model.longName,
              let imageUrl = model.imageURL else {
                  return
              }
        
        presenter?.presentHeaderView(
            titleLabel: title,
            imageUrl: imageUrl
        )
    }
    
    private func setInfoView(model: ServiceDetailsResponseModel) {
        presenter?.presentInfoView(model: model)
    }
    
    private func setStepView() {
        let step1 = ServiceDetailsStepViewCollectionViewCellModel(stepNumber: "1", stepName: "Answer the question")
        let step2 = ServiceDetailsStepViewCollectionViewCellModel(stepNumber: "2", stepName: "Get quotes")
        let step3 = ServiceDetailsStepViewCollectionViewCellModel(stepNumber: "3", stepName: "Compare the prices and decide")
        let viewModels: [ServiceDetailsStepViewCollectionViewCellModel] = [step1, step2, step3]
        presenter?.presentStepView(viewModel: viewModels)
    }
}

extension ServiceDetailsInteractor: ServiceDetailsInteractorProtocol {
    func viewDidLoad() {
        guard let serviceId = serviceId else { return }
        getServiceDetails(index: serviceId)
    }
}

