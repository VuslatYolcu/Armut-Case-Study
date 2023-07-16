//
//  PopularServicesCollectionViewCell.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 16.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

/// Single cell for a popular service
final class PopularServicesCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "PopularServicesCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let serviceNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(imageView)
        contentView.addSubview(serviceNameLabel)
        contentView.backgroundColor = .yellow
        addConstraints()
        
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: contentView.frame.size.height),
            
            serviceNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            serviceNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            serviceNameLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            //serviceNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
  
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        serviceNameLabel.text = nil
    }
    
    public func configure(serviceViewModel: ServiceModel) {
        guard let serviceImageUrl = serviceViewModel.imageURL, let imageUrl = URL(string: serviceImageUrl) else { return }
        imageView.load(url: imageUrl)
        serviceNameLabel.text = serviceViewModel.longName
    }
}

