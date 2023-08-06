//
//  ServiceDetailsView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

protocol ServiceDetailsViewDelegate: AnyObject {
    func didSelectService(index at: Int)
}

protocol ServiceDetailsDisplayProtocol: AnyObject {
    func displayHeaderView(viewModel: ServiceDetailsHeaderViewModel)
    func displayInfoViews(viewModel: ServiceDetailsInfoViewModel)
}

final class ServiceDetailsView: UIView {
    
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

    private let headerView: ServiceDetailsHeaderView = {
        let headerView = ServiceDetailsHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let infoView: ServiceDetailsInfoView = {
        let infoView = ServiceDetailsInfoView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.backgroundColor = .systemPink
        return infoView
    }()
    
    weak var delegate: ServiceDetailsViewDelegate?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Service is deinit")
    }
}

// MARK: - UI Setup
extension ServiceDetailsView {
    private func setupUI() {
        self.backgroundColor = .systemBackground
        self.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        
        scrollViewContainer.addArrangedSubview(headerView)
        scrollViewContainer.addArrangedSubview(infoView)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.heightAnchor.constraint(equalToConstant: 220),
            infoView.heightAnchor.constraint(equalToConstant: 30)
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
            // This is important for scrolling
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }

}

extension ServiceDetailsView: ServiceDetailsDisplayProtocol {
    
    func displayHeaderView(viewModel: ServiceDetailsHeaderViewModel) {
        headerView.configure(viewModel: viewModel)
    }
    
    func displayInfoViews(viewModel: ServiceDetailsInfoViewModel) {
        infoView.configure(viewModel: viewModel)
    }
}

