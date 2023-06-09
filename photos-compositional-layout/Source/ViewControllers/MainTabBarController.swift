//
//  ViewController.swift
//  photos-compositional-layout
//
//  Created by Zhuldyz Bukeshova on 16.03.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarController()
        setupTabBarViewControllers()
    }
    
    private func setupTabBarController() {
        tabBar.tintColor = .systemBlue
    }
    
    private func setupTabBarViewControllers() {
        viewControllers = [
            createNavController(for: LibraryController(),
                                title: "Library",
                                image: UIImage(systemName: "photo.on.rectangle.fill"),
                                selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill")),
            
            createNavController(for: ForYouController(),
                                title: "For You",
                                image: UIImage(systemName: "heart.text.square.fill"),
                                selectedImage: UIImage(systemName: "heart.text.square.fill")),
            
            createNavController(for: AlbumsController(),
                                title: "Albums",
                                image: UIImage(systemName: "rectangle.stack.fill"),
                                selectedImage: UIImage(systemName: "rectangle.stack.fill")),
            
            createNavController(for: SearchController(),
                                title: "Search",
                                image: UIImage(systemName: "magnifyingglass"),
                                selectedImage: UIImage(systemName: "magnifyingglass"))
        ]
    }
    
    private func createNavController(for rootViewController: UIViewController,
                                     title: String,
                                     image: UIImage?,
                                     selectedImage: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
