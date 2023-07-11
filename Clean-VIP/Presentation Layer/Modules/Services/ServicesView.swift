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
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .yellow
        return stackView
    }()
    
    private let headerView: ServicesHeaderView = {
        let headerView = ServicesHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .systemPink
        return headerView
    }()
    
    private let campaignView: CampaignView = {
       let campaignView = CampaignView()
        campaignView.translatesAutoresizingMaskIntoConstraints = false
        campaignView.configure(with: "wedding")
        campaignView.backgroundColor = .blue
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
        self.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(headerView)
        scrollViewContainer.addArrangedSubview(campaignView)
        setupConstraints()
        configureHeaderView()
    }
//    
//    private func initScrollView() {
//        view.addSubview(scrollView)
//        scrollView.addSubview(scrollViewContainer)
//        scrollViewContainer.addArrangedSubview(redView)
//        scrollViewContainer.addArrangedSubview(blueView)
//        scrollViewContainer.addArrangedSubview(greenView)
//        
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        
//        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
//        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
//        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
//        // this is important for scrolling
//        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
//    }
//    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollViewContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollViewContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 400)
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
