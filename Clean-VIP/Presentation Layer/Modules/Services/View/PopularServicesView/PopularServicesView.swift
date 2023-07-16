//
//  PopularServicesView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 16.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class PopularServicesView: UIView {
    
    // MARK: - Properties
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PopularServicesCollectionViewCell.self, forCellWithReuseIdentifier: PopularServicesCollectionViewCell.cellIdentifier)
        collectionView.backgroundColor = .orange
        return collectionView
    }()
    
    private let itemsPerRow: Double = 2.3
    private var sectionInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    private var popularServicesList = [ServiceModel]()
    
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
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
        ])
    }
    
    // MARK: - Configurations
    public func configure(with popularServicesList: PopularServicesViewModel) {
        label.text = popularServicesList.titleLabel
        self.popularServicesList = popularServicesList.serviceList
        collectionView.reloadData()
    }
}


// MARK: - CollectionView
extension PopularServicesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularServicesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularServicesCollectionViewCell.cellIdentifier, for: indexPath) as? PopularServicesCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(serviceViewModel: popularServicesList[indexPath.row])
        return cell
    }
   
}

extension PopularServicesView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        // Handle cell tap
    }
}


extension PopularServicesView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = Double(sectionInsets.left) * (itemsPerRow + 1)
        let availableWidth = Double(collectionView.frame.width) - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        //return CGSize(width: widthPerItem, height: widthPerItem)
        return CGSize(width: 130, height: 80)
    }
}
 

