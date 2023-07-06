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
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 25)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
        label.backgroundColor = .red
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.backgroundColor = .systemBlue
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let headerView: ServicesHeaderView = {
        let headerView = ServicesHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.configure(with: "header", with: .systemGray5)
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
    
    // MARK: - Actions
    public func updateLabel(with text: String) {
        titleLabel.text = text
    }
}

// MARK: - UI Setup
extension ServicesView {
    private func setupUI() {
        self.backgroundColor = .systemBackground
        self.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(headerView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])

    }
}
