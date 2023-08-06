//
//  ServiceDetailsViewController.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

protocol ServiceDetailsPresenterOutput: AnyObject {
    func presentHeaderView(viewModel: ServicesHeaderViewModel)
    func displayServiceDetails(viewModel: ServiceDetailsViewModel)
}

final class ServiceDetailsViewController: UIViewController {
    
    // MARK: - Properties
    var servicesView: ServiceDetailsView?
    var interactor: ServiceDetailsInteractorProtocol?
    weak var presenter: ServiceDetailsPresenterProtocol?
    var router: ServiceDetailsRouterProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        ServiceDetailsConfigurator.configureModule(viewController: self)
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
extension ServiceDetailsViewController: ServiceDetailsPresenterOutput {

    func presentHeaderView(viewModel: ServicesHeaderViewModel) {
        servicesView?.displayHeaderView(viewModel: viewModel)
    }
    
    func displayServiceDetails(viewModel: ServiceDetailsViewModel) {
        self.router?.routeToServiceDetail(with: "2")
    }
}

extension ServiceDetailsViewController: ServiceDetailsViewDelegate {
    func didSelectService(index at: Int) {
        self.interactor?.fetchServiceDetails(at: at)
    }
}

