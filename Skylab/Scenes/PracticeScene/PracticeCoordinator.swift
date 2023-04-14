//
//  PracticeCoordinator.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit

class PracticeCoordinator: Coordinator {
    
    let rootController: UINavigationController
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        openPracticeController()
    }
    
    private func openPracticeController() {
        let viewController = PracticeViewController.instantiate(coordinator: self)
        let viewModel = PracticeViewModel()
        viewController.viewModel = viewModel
        rootController.tabBarItem = UITabBarItem(title: TabBarItems.practice.rawValue,
                                                 image: TabBarItems.practice.image,
                                                 selectedImage: TabBarItems.practice.selectedImage)
        rootController.tabBarItem.setTitleText(font: AnonymousPro.bold(size: 10).font())
        rootController.setViewControllers([viewController], animated: true)
    }
}
