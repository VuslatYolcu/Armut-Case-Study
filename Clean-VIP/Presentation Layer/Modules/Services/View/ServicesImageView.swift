//
//  ServicesImageView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class ServicesImageView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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
    
    public func configure(with imageName: String, with backgroundColor: UIColor) {
        imageView.image = UIImage(named: imageName)
        imageView.backgroundColor = backgroundColor
    }
}

