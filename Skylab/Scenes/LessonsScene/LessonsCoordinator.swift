//
//  LessonsCoordinator.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit

class LessonsCordinator: Coordinator {
    
    let rootController: UINavigationController
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        openLessonsController()
    }
    
    private func openLessonsController() {
        let viewController = LessonsViewController.instantiate(coordinator: self)
        let viewModel = LessonsViewModel()
        viewController.viewModel = viewModel
        rootController.tabBarItem = UITabBarItem(title: TabBarItems.lessons.rawValue,
                                                 image: TabBarItems.lessons.image,
                                                 selectedImage: TabBarItems.lessons.selectedImage)
        rootController.tabBarItem.setTitleText(font: AnonymousPro.bold(size: 10).font())
        rootController.setViewControllers([viewController], animated: true)
    }
}
