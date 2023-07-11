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
        stackView.spacing = 8
        stackView.backgroundColor = .systemGreen
        return stackView
    }()

    private let bottomViewTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "FIRST TIME NEWLY WEDS"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private let bottomViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "WEDDING PHOTOGRAPHERS \nFROM 540TL"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
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
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 2)
        ])
    }
}

