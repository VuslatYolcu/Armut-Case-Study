//
//  ServicesHeaderView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 5.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class ServicesHeaderView: UIView {
    
    // MARK: - Properties
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 25)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
        label.backgroundColor = .red
        return label
    }()
    
    private let title: UILabel = {
        let title = UILabel()
        title.text = "Hey"
        return title
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
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
        let image = UIImage(named: imageName)
        //let size = CGSize(width: 100, height: 100)
        //let newImageWithOverlay = UIImage.createImageWithLabelOverlay(label: title, imageSize: size, image: image!)
        let point = CGPoint(x: 10, y: 10)
        let new = UIImage.textToImage(drawText: "Hello", inImage: image!, atPoint: point)
        imageView.image = new
        
        
        
        imageView.backgroundColor = backgroundColor
    }
}

