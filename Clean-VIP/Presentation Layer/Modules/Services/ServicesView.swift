//
//  ServicesView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class ServicesView: UIView {
    
    // MARK: - Properties
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let scrollViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 40
        return stackView
    }()

    private let headerView: ServicesHeaderView = {
        let headerView = ServicesHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let campaignView: CampaignView = {
        let campaignView = CampaignView()
        campaignView.translatesAutoresizingMaskIntoConstraints = false
        return campaignView
    }()

    private let allServicesView: AllServicesView = {
        let collectionView = AllServicesView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let popularServicesView: PopularServicesView = {
        let collectionView = PopularServicesView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let postsView: PostsView = {
        let collectionView = PostsView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Setup
extension ServicesView {
    private func setupUI() {
        self.backgroundColor = .systemBackground
        self.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        
        scrollViewContainer.addArrangedSubview(headerView)
        scrollViewContainer.addArrangedSubview(campaignView)
        scrollViewContainer.addArrangedSubview(allServicesView)
        scrollViewContainer.addArrangedSubview(popularServicesView)
        scrollViewContainer.addArrangedSubview(postsView)
        setupConstraints()
        
        configureHeaderViewModel()
        configureCampaignViewModel()
        configureAllServicesModel()
        fetchServicesPageData()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.heightAnchor.constraint(equalToConstant: 400),
            campaignView.heightAnchor.constraint(equalToConstant: 210),
            allServicesView.heightAnchor.constraint(equalToConstant: 210),
            popularServicesView.heightAnchor.constraint(equalToConstant: 170),
            postsView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: scrollViewContainer.frame.size.height + 100),
        ])
        
        NSLayoutConstraint.activate([
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            // this is important for scrolling
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
      
    }
    
    private func configureHeaderViewModel() {
        let headerViewModel = ServicesHeaderViewModel(
            titleLabel: "Hizmet piş \nağzıma düş",
            imageName: "header",
            headerBackgroundColor: .systemGray6,
            searchBarPlaceholder: "Which service do you need?",
            searchBarIconColor: .systemGreen
        )
        headerView.configure(with: headerViewModel)
    }
    
    private func configureCampaignViewModel() {
        let campaignViewModel = CampaignViewModel(
            imageName: "wedding",
            discountRatio: "-15%",
            bottomViewTitle: "FIRST TIME NEWLY WEDS",
            bottomViewLabel: "WEDDING PHOTOGRAPHERS \nFROM 540TL"
        )
        campaignView.configure(with: campaignViewModel)
    }
    
    private func configureAllServicesModel() {
        var allServicesList = [AllServicesCollectionViewCellModel]()
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Tadilat", imageName: "tadilat"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Temizlik", imageName: "temizlik"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Nakliyat", imageName: "nakliyat"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Tamir", imageName: "tamir"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Özel ders", imageName: "ozel_ders"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Saglik", imageName: "saglik"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Dugun", imageName: "dugun"))
        allServicesList.append(AllServicesCollectionViewCellModel(label: "Diger", imageName: "diger"))
        
        let allServicesViewModel = AllServicesViewModel(titleLabel: "All Services", serviceList: allServicesList)
        allServicesView.configure(with: allServicesViewModel)
    }
    
    private func fetchServicesPageData() {
        ServiceManager.shared.execute(.Home.homeRequest, expecting: ServicesResponseModel.self) { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.configurePopularServicesModel(popularServices: model.popularServices)
                    self?.configurePostsModel(blogPostList: model.posts)
                }
                break
            case .failure(let error):
                // TODO: Handle error
                print(error)
                break
            }
        }
    }
    
    private func configurePopularServicesModel(popularServices: [ServiceModel]) {
        let popularServicesViewModel = PopularServicesViewModel(titleLabel: "Popular these days", serviceList: popularServices)
        popularServicesView.configure(with: popularServicesViewModel)
    }
    
    private func configurePostsModel(blogPostList: [BlogPostModel]) {
        let postViewModel = PostsViewModel(titleLabel: "Latests from the blog", blogPostsList: blogPostList)
        postsView.configure(with: postViewModel)
    }
}
