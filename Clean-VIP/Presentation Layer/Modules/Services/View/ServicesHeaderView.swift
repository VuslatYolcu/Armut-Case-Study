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
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        return stackView
    }()
    
    private let headerImageView: ServicesImageView = {
        let imageView = ServicesImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hizmet piş \nağzıma düş"
        label.font = .boldSystemFont(ofSize: 50)
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let searchBarContainerView: UIView = {
        let containerView = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 50))
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add shadow to the container view
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowRadius = 4
        containerView.layer.masksToBounds = false
        
        return containerView
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = searchBar.bounds
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchTextField.backgroundColor = .white
        searchBar.barTintColor = .white

//        // MARK: - Shadow
//        searchBar.layer.shadowColor = UIColor.black.cgColor
//        searchBar.layer.shadowOffset = CGSize(width: 0, height: 2)
//        searchBar.layer.shadowOpacity = 0.8
//        searchBar.layer.shadowRadius = 10
//        searchBar.layer.masksToBounds = false
//
        searchBar.layer.cornerRadius = 15
        searchBar.clipsToBounds = true
        return searchBar
    }()


    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(stackView)
        stackView.addArrangedSubview(headerImageView)
        headerImageView.addSubview(imageStackView)
        imageStackView.addArrangedSubview(titleLabel)
        imageStackView.addArrangedSubview(searchBar)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Constraints
    private func setUpConstraints() {
        
        // MARK: - Stack View
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 0),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 0),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 0),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 0)
        ])
        
        // MARK: - Stack View
        NSLayoutConstraint.activate([
            imageStackView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 3),

            imageStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 3),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: imageStackView.trailingAnchor, multiplier: 2),
        ])

        // MARK: - Title
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
        ])
        
       
    }
    
    // MARK: - Configurations
    public func configure(imageName: String, backgroundColor: UIColor) {
        headerImageView.configure(with: imageName, with: backgroundColor)
    }

}

