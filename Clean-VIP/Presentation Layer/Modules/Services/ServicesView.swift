//
//  ServicesView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

protocol ServicesViewDelegate: AnyObject {
    func didSelectService(index at: Int)
}

protocol ServicesDisplayProtocol: AnyObject {
    func displayFetchedAllServices(viewModel: AllServicesViewModel)
    func displayHeaderView(viewModel: ServicesHeaderViewModel)
    func displayCampaingView(viewModel: CampaignViewModel)
    func displayPopularServicesView(viewModel: PopularServicesViewModel)
    func displayPostView(viewModel: PostsViewModel)
}

final class ServicesView: UIView {
    
    // MARK: - Properties
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        scrollView.scrollIndicatorInsets = scrollView.contentInset
        return scrollView
    }()
    
    private let scrollViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 40
        return stackView
    }()

    private let headerView: ServicesHeaderView = {
        let headerView = ServicesHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let campaignView: CampaignView = {
        let campaignView = CampaignView()
        campaignView.translatesAutoresizingMaskIntoConstraints = false
        return campaignView
    }()

    private let allServicesView: AllServicesView = {
        let collectionView = AllServicesView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let popularServicesView: PopularServicesView = {
        let collectionView = PopularServicesView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let postsView: PostsView = {
        let collectionView = PostsView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    weak var delegate: ServicesViewDelegate?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        allServicesView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Service is deinit")
    }
}

// MARK: - UI Setup
extension ServicesView {
    private func setupUI() {
        self.backgroundColor = .systemBackground
        self.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        
        scrollViewContainer.addArrangedSubview(headerView)
        scrollViewContainer.addArrangedSubview(campaignView)
        scrollViewContainer.addArrangedSubview(allServicesView)
        scrollViewContainer.addArrangedSubview(popularServicesView)
        scrollViewContainer.addArrangedSubview(postsView)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.heightAnchor.constraint(equalToConstant: 400),
            campaignView.heightAnchor.constraint(equalToConstant: 210),
            allServicesView.heightAnchor.constraint(equalToConstant: 210),
            popularServicesView.heightAnchor.constraint(equalToConstant: 170),
            postsView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            // this is important for scrolling
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }

}

extension ServicesView: ServicesDisplayProtocol {
    func displayFetchedAllServices(viewModel: AllServicesViewModel) {
        allServicesView.configure(with: viewModel)
    }
    
    func displayHeaderView(viewModel: ServicesHeaderViewModel) {
        headerView.configure(with: viewModel)
    }
    
    func displayCampaingView(viewModel: CampaignViewModel) {
        campaignView.configure(with: viewModel)
    }
    
    func displayPopularServicesView(viewModel: PopularServicesViewModel) {
        popularServicesView.configure(with: viewModel)
    }
    
    func displayPostView(viewModel: PostsViewModel) {
        postsView.configure(with: viewModel)
    }
}

extension ServicesView: AllServicesViewDelegate {
    func didSelectService(at index: Int) {
        delegate?.didSelectService(index: index)
    }
}
