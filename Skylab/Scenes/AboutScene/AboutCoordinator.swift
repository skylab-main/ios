//
//  AboutCoordinator.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit

class AboutCoordinator: Coordinator {
    
    let rootController: UINavigationController
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        openAboutController()
    }
    
    private func openAboutController() {
        let viewController = AboutViewController.instantiate(coordinator: self)
        let viewModel = AboutViewModel()
        viewController.viewModel = viewModel
        viewModel.coordinatorDelegate = self
        rootController.tabBarItem = UITabBarItem(title: TabBarItems.about.rawValue,
                                                 image: TabBarItems.about.image,
                                                 selectedImage: TabBarItems.about.selectedImage)
        rootController.tabBarItem.setTitleText(font: AnonymousPro.bold(size: 10).font())
        rootController.setViewControllers([viewController], animated: true)
    }
    
    fileprivate func openCourseDescriptionViewController() {
        
        let coordinator = CourseDescriptionCoordinator(rootController)
        coordinator.start()
    }

}

extension AboutCoordinator: AboutCoordinatorDelegate {
    
    func openCourseDescriptionViewControllerDelegate() {
        openCourseDescriptionViewController()
    }
}
