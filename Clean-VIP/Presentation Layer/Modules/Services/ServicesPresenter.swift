//
//  ServicesPresenter.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

protocol ServicesPresenterProtocol: AnyObject {
    func presentAllServices(allServicesTitle: String, allServicesList: [AllServicesCollectionViewCellModel])
    func presentHeaderView(titleLabel: String, imageName: String, searchBarPlaceHolder: String)
    func presentCampaignView(imageName: String, discountRatio: String, bottomViewTitle: String, bottomViewLabel: String)
    func presentPopularServicesView(titleLabel: String, serviceList: [ServiceModel])
    func presentPostView(titleLabel: String, blogPostsList: [BlogPostModel])
    func presentServiceDetails()
}

final class ServicesPresenter: ServicesPresenterProtocol {
    var viewController: ServicesPresenterOutput?
    
    func presentAllServices(allServicesTitle: String, allServicesList: [AllServicesCollectionViewCellModel]) {
        let viewModel = AllServicesViewModel(titleLabel: allServicesTitle, serviceList: allServicesList)
        viewController?.presentAllServices(viewModel: viewModel)
    }
    
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
    
    func presentCampaignView(imageName: String, discountRatio: String, bottomViewTitle: String, bottomViewLabel: String) {
        let campaignViewModel = CampaignViewModel(
            imageName: imageName,
            discountRatio: discountRatio,
            bottomViewTitle: bottomViewTitle,
            bottomViewLabel: bottomViewLabel
        )
        viewController?.presentCampaignView(viewModel: campaignViewModel)
    }
    
    func presentPopularServicesView(titleLabel: String, serviceList: [ServiceModel]) {
        let popularServicesViewModel = PopularServicesViewModel(
            titleLabel: "Popular these days",
            serviceList: serviceList
        )
        viewController?.presentPopularServicesView(viewModel: popularServicesViewModel)
    }
    
    func presentPostView(titleLabel: String, blogPostsList: [BlogPostModel]) {
        let postViewModel = PostsViewModel(
            titleLabel: titleLabel,
            blogPostsList: blogPostsList
        )
        viewController?.presentPostView(viewModel: postViewModel)
    }
    
    func presentServiceDetails() {
        viewController?.displayServiceDetails()
    }
    
    deinit {
        print("ServicesPresenter is deinit")
    }
}
