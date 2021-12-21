//
//  TabBarController.swift
//  PhotoApp
//
//  Created by Alikhan Tuxubayev on 21.12.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
            
    }
    
    private func setupTabBarController() {
        
        view.backgroundColor = .white

        let libraryViewController = UIViewController()
        let libraryImage = UIImage(systemName: "photo.fill.on.rectangle.fill")

        let forYouViewController = UIViewController()
        let forYouImage = UIImage(systemName: "heart.text.square.fill")

        let albumsViewController = AlbumViewController()
        let albumsImage = UIImage(systemName: "rectangle.stack.fill")

        let searchViewController = UIViewController()
        let searchImage = UIImage(systemName: "magnifyingglass")


        viewControllers = [
           
            generateNavigationController(rootViewController: libraryViewController, title: "Library", image: libraryImage!),
            generateNavigationController(rootViewController: forYouViewController, title: "For you", image: forYouImage!),
            generateNavigationController(rootViewController: albumsViewController, title: "Albums", image: albumsImage!),
            generateNavigationController(rootViewController: searchViewController, title: "Search", image: searchImage!)


        ]
        }

    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
            
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
