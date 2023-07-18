//
//  PostsView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 18.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class PostsView: UIView {
    
    // MARK: - Properties
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PostsViewCollectionViewCell.self, forCellWithReuseIdentifier: PostsViewCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    private var blogPostsList = [BlogPostModel]()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(label)
        self.addSubview(collectionView)
        setUpConstraints()
        setUpCollectionView()
    }
    
    private func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Constraints
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            trailingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 3),
            label.topAnchor.constraint(equalTo: topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: collectionView.trailingAnchor, multiplier: 2),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15),
        ])
    }
    
    // MARK: - Configurations
    public func configure(with postsViewModel: PostsViewModel) {
        label.text = postsViewModel.titleLabel
        self.blogPostsList = postsViewModel.blogPostsList
        collectionView.reloadData()
    }
}


// MARK: - CollectionView
extension PostsView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return blogPostsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostsViewCollectionViewCell.cellIdentifier, for: indexPath) as? PostsViewCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(postModel: blogPostsList[indexPath.row])
        return cell
    }
   
}

extension PostsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        // Handle cell tap
    }
}


extension PostsView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 200)
    }
}
