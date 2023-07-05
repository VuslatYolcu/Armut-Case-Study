//
//  ServicesView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class ServicesView: UIView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    public func updateLabel(with text: String) {
        titleLabel.text = text
    }
    
    // MARK: - Properties
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 25)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

// MARK: - UI Setup
extension ServicesView {
    private func setupUI() {
        self.backgroundColor = .systemGray
        
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

//private let imageView: UIImageView = {
//    let imageView = UIImageView()
//    imageView.contentMode = .scaleAspectFill
//    imageView.clipsToBounds = true
//    imageView.translatesAutoresizingMaskIntoConstraints = false
//    return imageView
//}()
//
//override init(frame: CGRect) {
//    super.init(frame: frame)
//    contentView.addSubview(imageView)
//    setUpConstraints()
//}
//
//required init?(coder: NSCoder) {
//    fatalError()
//}
//
//private func setUpConstraints() {
//    NSLayoutConstraint.activate([
//        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//        imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//    ])
//}
