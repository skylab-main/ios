//
//  SecondPageCoordinator.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import UIKit

class SecondPageCoordinator: Coordinator {

    let rootController: UINavigationController

    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }

    override func start() {
        let viewController = SecondPageViewController.instantiate(coordinator: self)
        rootController.tabBarItem = UITabBarItem(title: "Second",
                                                 image: nil,
                                                 selectedImage: nil)
        rootController.pushViewController(viewController, animated: false)
    }
}
