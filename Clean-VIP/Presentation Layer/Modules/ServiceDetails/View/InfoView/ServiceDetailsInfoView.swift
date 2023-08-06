//
//  ServiceDetailsInfoView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class ServiceDetailsInfoView: UIView {
    
//    private let imageView: ServicesImageView = {
//        let imageView = ServicesImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(label)
        addConstraints()
        
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 10),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])

    }
    
    public func configure(viewModel: ServiceDetailsHeaderViewModel) {
        imageView.image = UIImage(named: viewModel.imageURL)
        label.text =
        guard let headerImageUrl = viewModel.imageURL, let imageUrl = URL(string: headerImageUrl) else { return }
        imageView.configure(with: imageUrl)
        titleLabel.text = viewModel.title
        imageView.addFadingEffectToBottom(width: imageView.frame.size.width, height: imageView.frame.size.height)
    }

}



