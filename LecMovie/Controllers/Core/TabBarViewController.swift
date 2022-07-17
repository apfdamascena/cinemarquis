//
//  TabBarViewController.swift
//  LecMovie
//
//  Created by alexdamascena on 06/07/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let supportedPopularSections = SectionContainer(handlers: [ PopularSectionHandler() ])
    
    let controllers: [UIViewController]

    init(){
        self.controllers = [
            FeaturedViewController(sectionContainer: supportedPopularSections)
        ]
        super.init()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.controllers = [
            FeaturedViewController(sectionContainer: supportedPopularSections)
        ]
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let icons = [
        ["film","film.fill"]
    ]
    
    var navigationControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewControllers()
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

}
