//
//  PostsViewCollectionViewCell.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 18.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

/// Single cell for a posts service
final class PostsViewCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "PostsViewCollectionViewCell"
    
    /*
    private let imageView: PostsImageView = {
        let imageView = PostsImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
     */
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textColor = .white
        label.backgroundColor = .orange
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.addSubview(categoryLabel)
        imageView.addSubview(titleLabel)
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
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: categoryLabel.trailingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10)
        ])

    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
  
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        categoryLabel.text = nil
        titleLabel.text = nil
    }
    
    public func configure(postModel: BlogPostModel) {
        guard let postImageUrl = postModel.imageURL, let imageUrl = URL(string: postImageUrl) else { return }
        
        categoryLabel.text = postModel.category
        titleLabel.text = postModel.title
        configureCachedImageView(with: imageUrl)
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

