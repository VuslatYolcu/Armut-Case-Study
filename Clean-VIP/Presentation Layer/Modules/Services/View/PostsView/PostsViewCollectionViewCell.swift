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
    
    private let imageView: PostsImageView = {
        let imageView = PostsImageView()
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
            titleLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10)
        ])

    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
  
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.resetImage()
        categoryLabel.text = nil
        titleLabel.text = nil
    }
    
    
    public func configure(postModel: BlogPostModel) {
        guard let postImageUrl = postModel.imageURL, let imageUrl = URL(string: postImageUrl) else { return }
        
        imageView.configure(with: imageUrl)
        categoryLabel.text = postModel.category
        titleLabel.text = postModel.title
        imageView.addFadingEffect(width: contentView.frame.size.width, height: contentView.frame.size.height)
        addSpaceForLabel(title: postModel.title)
    }
    
    private func addSpaceForLabel(title: String) {
        let spacedTitle = NSAttributedString(string: title).withLineSpacing(4)
        titleLabel.attributedText = spacedTitle
    }
    
}

