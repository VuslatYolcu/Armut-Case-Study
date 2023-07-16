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
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .systemGreen
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let campaignBottomView: CampaignBottomView = {
        let view = CampaignBottomView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    private let discountView: CampaignDiscountView = {
        let discountView = CampaignDiscountView()
        discountView.translatesAutoresizingMaskIntoConstraints = false
        discountView.clipsToBounds = true
        discountView.layer.cornerRadius = 10
        return discountView
    }()
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        imageView.addSubview(campaignBottomView)
        imageView.addSubview(discountView)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Constraints
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 4),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            campaignBottomView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            campaignBottomView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            campaignBottomView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            campaignBottomView.heightAnchor.constraint(equalToConstant: 75)
        ])
        
        NSLayoutConstraint.activate([
            discountView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8),
            discountView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 25)
        ])
    
    }
    
    // MARK: - Configuration
    public func configure(with campaignViewModel: CampaignViewModel) {
        imageView.image = UIImage(named: campaignViewModel.imageName)
        discountView.configure(text: campaignViewModel.discountRatio)
        campaignBottomView.configure(titleLabelText: campaignViewModel.bottomViewTitle, labelText: campaignViewModel.bottomViewLabel)
    }
}
