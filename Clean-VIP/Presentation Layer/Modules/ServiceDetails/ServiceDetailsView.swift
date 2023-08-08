//
//  ServiceDetailsView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

protocol ServiceDetailsViewDelegate: AnyObject {
    func didSelectService(index at: Int)
}

protocol ServiceDetailsDisplayProtocol: AnyObject {
    func displayHeaderView(viewModel: ServiceDetailsHeaderViewModel)
    func displayInfoViews(viewModels: [ServiceDetailsInfoViewModel])
    func displayStepsView(viewModel: [ServiceDetailsStepViewCollectionViewCellModel])
}

final class ServiceDetailsView: UIView {
    
    // MARK: - Properties
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        scrollView.scrollIndicatorInsets = scrollView.contentInset
        return scrollView
    }()
    
    private let scrollViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    private let infoViewStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()

    private let headerView: ServiceDetailsHeaderView = {
        let headerView = ServiceDetailsHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let seperatorView: SeperatorView = {
        let view = SeperatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ServiceDetailsStepViewCollectionViewCell.self, forCellWithReuseIdentifier: ServiceDetailsStepViewCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    private let stepsView: ServiceDetailsStepsView = {
        let view = ServiceDetailsStepsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    weak var delegate: ServiceDetailsViewDelegate?
    private var stepsViewModel = [ServiceDetailsStepViewCollectionViewCellModel]()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Service is deinit")
    }
}

// MARK: - UI Setup
extension ServiceDetailsView {
    private func setupUI() {
        self.backgroundColor = .systemBackground
        self.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        
        scrollViewContainer.addArrangedSubview(headerView)
        scrollViewContainer.addArrangedSubview(infoViewStackView)
        scrollViewContainer.addArrangedSubview(seperatorView)
        scrollViewContainer.addArrangedSubview(stepsView)
        setupConstraints()
        setUpCollectionView()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.heightAnchor.constraint(equalToConstant: 220),
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            // This is important for scrolling
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            infoViewStackView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 12),
            infoViewStackView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            seperatorView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 12),
            seperatorView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            stepsView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    private func createInfoView(viewModel: ServiceDetailsInfoViewModel) {
        let infoView = ServiceDetailsInfoView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.configure(viewModel: viewModel)
        infoViewStackView.addArrangedSubview(infoView)
        infoView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    // MARK: - Configurations
    private func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }

}

extension ServiceDetailsView: ServiceDetailsDisplayProtocol {
    
    func displayHeaderView(viewModel: ServiceDetailsHeaderViewModel) {
        headerView.configure(viewModel: viewModel)
    }
    
    func displayInfoViews(viewModels: [ServiceDetailsInfoViewModel]) {
        for viewModel in viewModels {
            createInfoView(viewModel: viewModel)
        }
    }
    
    func displayStepsView(viewModel: [ServiceDetailsStepViewCollectionViewCellModel]) {
        stepsView.configure(with: viewModel)
//        stepsViewModel = viewModel
//        collectionView.reloadData()
    }
    
    public func configure(vm: [ServiceDetailsStepViewCollectionViewCellModel]) {
        stepsViewModel = vm
        stepsView.configure(with: vm)
    }
}

// MARK: - Collection View
extension ServiceDetailsView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stepsViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceDetailsStepViewCollectionViewCell.cellIdentifier, for: indexPath) as? ServiceDetailsStepViewCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(viewModel: stepsViewModel[indexPath.row])
        return cell
    }
   
}

extension ServiceDetailsView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 200)
    }
}

extension ServiceDetailsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        // Handle cell tap
    }
}
