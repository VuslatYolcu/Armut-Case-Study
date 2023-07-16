//
//  AllServicesCollectionViewCell.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 12.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

/// Single cell for a service
final class AllServicesCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "AllServicesCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let serviceNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(imageView)
        contentView.addSubview(serviceNameLabel)
        addConstraints()
        setupLayer()
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            serviceNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            serviceNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])

    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupLayer()
    }
    
    private func setupLayer() {
        contentView.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        serviceNameLabel.text = nil
    }
    
    public func configure(serviceViewModel: AllServicesCollectionViewCellModel) {
        imageView.image = UIImage(named: serviceViewModel.imageName)
        serviceNameLabel.text = serviceViewModel.label
    }
}
