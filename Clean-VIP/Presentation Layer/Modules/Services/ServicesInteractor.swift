//
//  ServicesInteractor.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

protocol ServicesInteractorProtocol: AnyObject {
    func viewDidLoad()
}

final class ServicesInteractor {
    
    var presenter: ServicesPresenterProtocol?

    private func fetchAllServices() {
        var allServicesList = [AllServicesCollectionViewCellModel]()
        allServicesList.append(AllServicesCollectionViewCellModel(label: "services.renovation.title".localized(), imageName: "tadilat"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "services.transportation.title".localized(), imageName: "temizlik"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "services.cleaning.title".localized(), imageName: "nakliyat"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "services.repair.title".localized(), imageName: "tamir"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "services.privatelesson.title".localized(), imageName: "ozel_ders"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "services.health.title".localized(), imageName: "saglik"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "services.wedding.title".localized(), imageName: "dugun"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "services.other.title".localized(), imageName: "diger"))
        presenter?.presentAllServices(allServicesTitle: "All Services", allServicesList: allServicesList)
    }
    
    private func setHeaderView() {
        presenter?.presentHeaderView(
            titleLabel: "Hizmet piş \nağzıma düş",
            imageName: "header",
            searchBarPlaceHolder: "Which service do you need?"
        )
    }
    
    private func setCampaignView() {
        presenter?.presentCampaignView(
            imageName: "wedding",
            discountRatio: "-15%",
            bottomViewTitle: "FIRST TIME NEWLY WEDS",
            bottomViewLabel: "WEDDING PHOTOGRAPHERS \nFROM 540TL"
        )
    }
    
    private func fetchServices() {
        ServiceManager.shared.execute(
            .Home.homeRequest,
            expecting: ServicesResponseModel.self)
        { [weak self] result in
            
            guard let self = self else { return }
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.configurePopularServicesModel(popularServices: model.popularServices)
                    self.configurePostsModel(blogPostList: model.posts)
                }
                break
            case .failure(let error):
                // TODO: Handle error
                print(error)
                break
            }
        }
    }

    private func configurePopularServicesModel(popularServices: [ServiceModel]) {
        presenter?.presentPopularServicesView(
            titleLabel: "Popular these days",
            serviceList: popularServices
        )
    }
    
    private func configurePostsModel(blogPostList: [BlogPostModel]) {
        presenter?.presentPostView(
            titleLabel: "Latests from the blog",
            blogPostsList: blogPostList
        )
    }
}

extension ServicesInteractor: ServicesInteractorProtocol {
    func viewDidLoad() {
        fetchServices()
        fetchAllServices()
        setHeaderView()
        setHeaderView()
        setCampaignView()
    }
}

enum ServiceId: String, CaseIterable {
    case tadilat = "208"
    case temizlik = "191"
    case nakliyat = "142"
    case tamir = "533"
    case ozel_ders = "608"
    case dugun = "59"
    case evlilik = "5819"
}
