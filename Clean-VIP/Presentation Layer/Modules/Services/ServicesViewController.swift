//
//  ServicesViewController.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

protocol ServicesPresenterOutput: AnyObject {
    func presentAllServices(viewModel: AllServicesViewModel)
    func presentHeaderView(viewModel: ServicesHeaderViewModel)
    func presentCampaignView(viewModel: CampaignViewModel)
    func presentPopularServicesView(viewModel: PopularServicesViewModel)
    func presentPostView(viewModel: PostsViewModel)
    func displayServiceDetails()
}

final class ServicesViewController: UIViewController {
    
    // MARK: - Properties
    var servicesView: ServicesView?
    var interactor: ServicesInteractorProtocol?
    weak var presenter: ServicesPresenterProtocol?
    var router: ServicesRouterProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        ServicesConfigurator.configureModule(viewController: self)
        self.interactor?.viewDidLoad()
        /// I want to call configurator from router but I could not find a way to call configureModule from UITabBarItem.
        self.tabBarController?.navigationItem.titleView?.removeFromSuperview()
        self.tabBarController?.navigationItem.title?.removeAll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    deinit {
        print("deinit is called")
    }

}

// MARK: - Presenter Output
extension ServicesViewController: ServicesPresenterOutput {
 
    func presentAllServices(viewModel: AllServicesViewModel) {
        servicesView?.displayFetchedAllServices(viewModel: viewModel)
    }
    
    func presentHeaderView(viewModel: ServicesHeaderViewModel) {
        servicesView?.displayHeaderView(viewModel: viewModel)
    }
    
    func presentCampaignView(viewModel: CampaignViewModel) {
        servicesView?.displayCampaingView(viewModel: viewModel)
    }

    func presentPopularServicesView(viewModel: PopularServicesViewModel) {
        servicesView?.displayPopularServicesView(viewModel: viewModel)
    }
    
    func presentPostView(viewModel: PostsViewModel) {
        servicesView?.displayPostView(viewModel: viewModel)
    }
    
    func displayServiceDetails() {
        self.router?.routeToServiceDetail(with: "2")
    }
}

extension ServicesViewController: ServicesViewDelegate {
    func didSelectService(index at: Int) {
        self.interactor?.fetchServiceDetails()
    }
}
