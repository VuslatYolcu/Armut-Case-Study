//
//  ServiceDetailsViewController.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

protocol ServiceDetailsPresenterOutput: AnyObject {
    func presentHeaderView(viewModel: ServiceDetailsHeaderViewModel)
    func presentInfoView(viewModels: [ServiceDetailsInfoViewModel])
    func displayServiceDetails(viewModel: ServiceDetailsViewModel)
}

final class ServiceDetailsViewController: UIViewController {
    
    // MARK: - Properties
    var serviceDetailsView: ServiceDetailsView?
    var interactor: ServiceDetailsInteractorProtocol?
    weak var presenter: ServiceDetailsPresenterProtocol?
    var router: ServiceDetailsRouterProtocol?
    
    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        self.view = serviceDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interactor?.viewDidLoad()
        self.navigationController?.tabBarController?.tabBar.isHidden = true
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

    func presentHeaderView(viewModel: ServiceDetailsHeaderViewModel) {
        serviceDetailsView?.displayHeaderView(viewModel: viewModel)
    }

    func presentInfoView(viewModels: [ServiceDetailsInfoViewModel]) {
        serviceDetailsView?.displayInfoViews(viewModels: viewModels)
    }
    
    func displayServiceDetails(viewModel: ServiceDetailsViewModel) {
        //self.router?.routeToServiceDetail(with: "2")
    }
}

extension ServiceDetailsViewController: ServiceDetailsViewDelegate {
    func didSelectService(index at: Int) {
        //self.interactor?.fetchServiceDetails(at: at)
    }
}

