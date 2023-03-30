//
//  MainTabBarVC.swift
//  MyMusic
//
//  Created by dzmitry on 29.03.23.
//

import UIKit

class MainTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        let searchVC = SearchVC()
        let libraryVC = ViewController()
        
        viewControllers = [generateViewController(rootViewController: searchVC, image: #imageLiteral(resourceName: "search"), title: "Search"), generateViewController(rootViewController: libraryVC, image: #imageLiteral(resourceName: "library"), title: "Library")]
    }
    
    private func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC
    }
}
