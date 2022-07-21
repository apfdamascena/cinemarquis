//
//  TabBarViewController.swift
//  LecMovie
//
//  Created by alexdamascena on 06/07/22.
//

import UIKit

class TabBarViewController: UITabBarController {
        
    let controllers: [UIViewController]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.controllers = [
            FeaturedViewController(),
            TrendingViewController(),
            SearchViewController()
        ]
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let icons = [
        ["film","film.fill"],
        ["flame", "flame.fill"],
        ["magnifyingglass", "magnifyingglass.fill"]
    ]
    
    var navigationControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewControllers()
        setupBar()
    }
    
    private func setupViewControllers(){
        controllers.enumerated().forEach{ (index, viewController) in
            viewController.navigationItem.largeTitleDisplayMode = .always
            let navigationController = UINavigationController(rootViewController: viewController)

            navigationController.navigationBar.prefersLargeTitles = true
            navigationController.tabBarItem =  UITabBarItem(title: viewController.title,
                                                            image: UIImage(systemName: icons[index][0]),
                                                            selectedImage: UIImage(systemName: icons[index][1]))
            navigationControllers.append(navigationController)
            setViewControllers(navigationControllers, animated: true)
        }
    }
    
    private func setupBar(){
        self.tabBar.barTintColor = UIColor(named: Constants.PRIMARY)
    }
    

}
