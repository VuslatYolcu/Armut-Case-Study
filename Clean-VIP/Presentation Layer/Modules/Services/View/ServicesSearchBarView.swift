//
//  ServicesSearchBarView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 9.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class ServicesSearchBarView: UIView {
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = searchBar.bounds
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchTextField.backgroundColor = .white
        searchBar.barTintColor = .white
        // MARK: - Rounded corners
        searchBar.layer.cornerRadius = 10
        searchBar.clipsToBounds = true
        return searchBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(searchBar)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            searchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    public func configure(text placeHolder: String, color searchIcon: UIColor) {
        searchBar.placeholder = placeHolder
        searchBar.searchTextField.leftView?.tintColor = searchIcon
    }
}
