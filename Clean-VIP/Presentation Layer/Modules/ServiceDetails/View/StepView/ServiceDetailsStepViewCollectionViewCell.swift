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
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.cornerRadius = label.frame.width/2
        label.clipsToBounds = true
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.layer.borderColor = UIColor.systemGray5.cgColor
        label.layer.borderWidth = 2.0
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .medium)
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(circularLabel)
        contentView.addSubview(bottomLabel)
        addConstraints()
        
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            circularLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            circularLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            circularLabel.heightAnchor.constraint(equalToConstant: 80),
            circularLabel.widthAnchor.constraint(equalToConstant: 80),
        ])
        
        NSLayoutConstraint.activate([
            bottomLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bottomLabel.topAnchor.constraint(equalTo: circularLabel.bottomAnchor, constant: 25),
            bottomLabel.widthAnchor.constraint(equalToConstant: 150),
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
        bottomLabel.text = viewModel.stepName
    }

}

