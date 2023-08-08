//
//  ServiceDetailsHeaderView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class ServiceDetailsHeaderView: UIView {
    
    private let imageView: PostsImageView = {
        let imageView = PostsImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.addSubview(titleLabel)
        addConstraints()
        
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -5),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10)
        ])

    }
    
    public func configure(viewModel: ServiceDetailsHeaderViewModel) {
        guard let headerImageUrl = viewModel.imageURL, let imageUrl = URL(string: headerImageUrl) else { return }
        imageView.configure(with: imageUrl)
        titleLabel.text = viewModel.title
        imageView.addFadingEffectToBottom(width: imageView.frame.size.width, height: imageView.frame.size.height)
    }

}

