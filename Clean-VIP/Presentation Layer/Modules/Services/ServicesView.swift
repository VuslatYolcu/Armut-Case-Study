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
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let headerView: ServicesHeaderView = {
        let headerView = ServicesHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
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
        self.addSubview(stackView)
        stackView.addArrangedSubview(headerView)
        setupConstraints()
        configureHeaderView()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
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
