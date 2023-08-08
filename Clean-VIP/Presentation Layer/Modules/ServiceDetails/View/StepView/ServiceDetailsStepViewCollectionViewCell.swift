//
//  ServiceDetailsStepViewCollectionViewCell.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 8.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

/// Single cell for a service details step
final class ServiceDetailsStepViewCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "ServiceDetailsStepViewCollectionViewCell"
    
    private let circularLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.layer.cornerRadius = label.bounds.width / 2
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 2.0
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(circularLabel)
        addConstraints()
        
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            circularLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circularLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circularLabel.heightAnchor.constraint(equalToConstant: 30),
            circularLabel.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        circularLabel.text = nil

    }
    
    public func configure(viewModel: ServiceDetailsStepViewCollectionViewCellModel) {
        circularLabel.text = viewModel.stepNumber
        
    }

}

