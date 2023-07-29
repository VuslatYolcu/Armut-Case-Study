//
//  ServicesInteractor.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

protocol ServicesBusinessLogic: AnyObject {
    func viewDidLoad()
}

final class ServicesInteractorImplementation: ServicesBusinessLogic {
    
    var presenter: ServicesPresenter?
    
    func viewDidLoad() {
        fetchAllServices()
    }

    private func fetchAllServices() {
        var allServicesList = [AllServicesCollectionViewCellModel]()
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Tadilat", imageName: "tadilat"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Temizlik", imageName: "temizlik"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Nakliyat", imageName: "nakliyat"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Tamir", imageName: "tamir"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Özel ders", imageName: "ozel_ders"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Saglik", imageName: "saglik"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Dugun", imageName: "dugun"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Diger", imageName: "diger"))
        
        presenter?.presentAllServices(allServicesTitle: "All Services", allServicesList: allServicesList)
    }
}
