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
                    
                }
                break
            case .failure(let error):
                // TODO: Handle error
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
        guard let proCount = model.proCount else { return }
        presenter?.presentInfoView(label: String(proCount), type: .professionals)
    }
    
}

extension ServiceDetailsInteractor: ServiceDetailsInteractorProtocol {
    func viewDidLoad() {
        guard let serviceId = serviceId else { return }
        getServiceDetails(index: serviceId)
    }
}

