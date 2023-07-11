//
//  CampaignView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 11.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class CampaignView: UIView {
    
    // MARK: - Properties
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        return view
    }()
    
    private let bottomViewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
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
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(bottomView)
        
        bottomView.addSubview(bottomViewStackView)
        bottomViewStackView.addArrangedSubview(bottomViewTitleLabel)
        bottomViewStackView.addArrangedSubview(bottomViewLabel)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Constraints
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomViewStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: bottomView.leadingAnchor, multiplier: 2),
            bottomView.trailingAnchor.constraint(equalToSystemSpacingAfter: bottomViewStackView.trailingAnchor, multiplier: 2),
            bottomViewStackView.topAnchor.constraint(equalToSystemSpacingBelow: bottomView.topAnchor, multiplier: 2)
        ])
    }
    
    // MARK: - Configuration
    public func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
