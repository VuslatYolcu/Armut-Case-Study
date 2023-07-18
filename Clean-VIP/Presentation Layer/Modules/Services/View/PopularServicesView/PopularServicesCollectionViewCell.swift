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
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let serviceNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(serviceNameLabel)
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
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            serviceNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            serviceNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            serviceNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor)
            
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
        
        serviceNameLabel.text = serviceViewModel.longName
        configureImageView(with: imageUrl)
    }
    
    private func configureImageView(with imageUrl: URL) {
        fetchImage(imageUrl: imageUrl) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: data)
                }
            case .failure:
                break
            }
        }
    }
    
    private func fetchImage(imageUrl: URL?, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let imageUrl = imageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        ImageLoader.shared.downloadImage(imageUrl, completion: completion)
    }

}

