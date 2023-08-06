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
    
    private func setHeaderView() {
        presenter?.presentHeaderView(
            titleLabel: "Hizmet piş \nağzıma düş",
            imageName: "header",
            searchBarPlaceHolder: "Which service do you need?"
        )
    }
    
}

extension ServiceDetailsInteractor: ServiceDetailsInteractorProtocol {
    func viewDidLoad() {
        guard let serviceId = serviceId else { return }
        getServiceDetails(index: serviceId)
    }
}

