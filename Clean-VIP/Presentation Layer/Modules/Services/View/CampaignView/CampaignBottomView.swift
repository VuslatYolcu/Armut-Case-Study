//
//  CampaignBottomView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 11.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class CampaignBottomView: UIView {
    
    // MARK: - Properties
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()

    private let bottomViewTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private let bottomViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        stackView.addArrangedSubview(bottomViewTitleLabel)
        stackView.addArrangedSubview(bottomViewLabel)

        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Constraints
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 2),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8)

        ])
    }
    
    public func configure(titleLabelText: String, labelText: String) {
        bottomViewTitleLabel.text = titleLabelText
        bottomViewLabel.text = labelText
    }
}

