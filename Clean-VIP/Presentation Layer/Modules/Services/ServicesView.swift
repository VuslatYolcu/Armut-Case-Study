//
//  ServicesView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class ServicesView: UIView {
    
    // MARK: - Properties
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let scrollViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
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
        campaignView.configure(with: "wedding")
        return campaignView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        setupConstraints()
        configureHeaderView()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 1000),
        ])
        
        NSLayoutConstraint.activate([
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            // this is important for scrolling
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerView.heightAnchor.constraint(equalToConstant: 400),
            campaignView.heightAnchor.constraint(equalToConstant: 210),
            scrollViewContainer.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    private func configureHeaderView() {
        let headerViewModel = ServicesHeaderViewModel(
            titleLabel: "Hizmet piş \nağzıma düş",
            imageName: "header",
            headerBackgroundColor: .systemGray6,
            searchBarPlaceholder: "Which service do you need?",
            searchBarIconColor: .systemGreen
        )
        headerView.configure(with: headerViewModel)
    }
    
}
