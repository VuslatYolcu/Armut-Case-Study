//
//  PostsImageView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 18.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class PostsImageView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureCachedImageView(with imageUrl: URL) {
        CachedImageLoader.shared.fetchImage(imageUrl: imageUrl) { [weak self] result in
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
    
}

// MARK: - Public

extension PostsImageView {
    public func configure(with imageURL: URL) {
        configureCachedImageView(with: imageURL)
    }
    
    public func resetImage() {
        imageView.image = nil
    }
}


