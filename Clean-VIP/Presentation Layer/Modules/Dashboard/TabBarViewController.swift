//
//  DashboardViewController.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

/// Controller to house tabs and root view controllers
final class TabBarViewController: UITabBarController {

    // MARK: - Properties
    var router: TabBarRouter?
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTabs()
    }
}

// MARK: - Set up Tabs
extension TabBarViewController {
    
    private func setupTabs() {
       
        let servicesVC = ServicesViewController()
        let jobsVC = TitleDetailViewController()
        let notificationsVC = NotificationsViewController()
        let profilesVC = ProfilesViewController()
        
        servicesVC.navigationItem.largeTitleDisplayMode = .automatic
        jobsVC.navigationItem.largeTitleDisplayMode = .automatic
        notificationsVC.navigationItem.largeTitleDisplayMode = .automatic
        profilesVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: servicesVC)
        let nav2 = UINavigationController(rootViewController: jobsVC)
        let nav3 = UINavigationController(rootViewController: notificationsVC)
        let nav4 = UINavigationController(rootViewController: profilesVC)
        
        let servicesIcon = UIImage(systemName: "magnifyingglass")?.withTintColor(.systemGray6, renderingMode: .alwaysOriginal)
        let jobsIcon = UIImage(systemName: "bag")?.withTintColor(.systemGray6, renderingMode: .alwaysOriginal)
        let notifacationsIcon = UIImage(systemName: "bell")?.withTintColor(.systemGray6, renderingMode: .alwaysOriginal)
        let profileIcon = UIImage(systemName: "person")?.withTintColor(.systemGray6, renderingMode: .alwaysOriginal)
        
        nav1.tabBarItem = UITabBarItem(title: "Services", image: servicesIcon, tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Jobs", image: jobsIcon, tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Notifications", image: notifacationsIcon, tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Profile", image: profileIcon, tag: 4)
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        setViewControllers([nav1, nav2, nav3, nav4],
                           animated: true)
        
      
    }
}



