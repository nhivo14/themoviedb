//
//  ViewController.swift
//  NetflixClone
//
//  Created by NhiVHY on 27/01/2024.
//

import UIKit

class MainTabBarViewController: UITabBarController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let nav1 = UINavigationController(rootViewController: HomeViewController())
        let nav2 = UINavigationController(rootViewController: UpcomingViewController())
        let nav3 = UINavigationController(rootViewController: SearchViewController())
        let nav4 = UINavigationController(rootViewController: DownloadViewController())
        
        nav1.tabBarItem.image = UIImage(systemName: "house")
        nav2.tabBarItem.image = UIImage(systemName: "play.circle")
        nav3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        nav4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")

        nav1.title = "Home"
        nav2.title = "Coming soon"
        nav3.title = "Top search"
        nav4.title = "Downloads"
        
        tabBar.tintColor = .cyan
         
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)

    }


}

