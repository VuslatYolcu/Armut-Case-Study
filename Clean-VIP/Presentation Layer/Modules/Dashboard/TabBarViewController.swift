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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTabs()
    }

    private func setupTabs() {
        let servicesVC = ServicesViewController()
        let jobsVC = JobsViewController()
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
        
        nav1.tabBarItem = UITabBarItem(title: "Character", image: UIImage(systemName: "person"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        setViewControllers([nav1, nav2, nav3, nav4],
                           animated: true)
    }
}



