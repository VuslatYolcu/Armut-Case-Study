//
//  AllServicesView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 12.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

protocol AllServicesViewDelegate: AnyObject {
    func didSelectService(at index: Int)
}

final class AllServicesView: UIView {
    
    // MARK: - Properties
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(AllServicesCollectionViewCell.self, forCellWithReuseIdentifier: AllServicesCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    weak var delegate: AllServicesViewDelegate?
    
    private let itemsPerRow: Int = 4
    private var sectionInsets = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
    private var allServicesList = [AllServicesCollectionViewCellModel]()
    
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
    public func configure(with allServicesList: AllServicesViewModel) {
        label.text = allServicesList.titleLabel
        self.allServicesList = allServicesList.serviceList
        
    }
}


// MARK: - CollectionView
extension AllServicesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allServicesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllServicesCollectionViewCell.cellIdentifier, for: indexPath) as? AllServicesCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(serviceViewModel: allServicesList[indexPath.row])
        return cell
    }
   
}

extension AllServicesView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectService(at: indexPath.row)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension AllServicesView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = Int(sectionInsets.left) * (itemsPerRow + 1)
        let availableWidth = Int(collectionView.frame.width) - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
}
