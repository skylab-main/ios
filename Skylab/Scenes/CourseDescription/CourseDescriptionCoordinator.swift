//
//  CourseDescriptionCoordinator.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 23/05/2023.
//

import UIKit
import Swinject


class CourseDescriptionCoordinator: Coordinator {
    
    let rootController: UINavigationController
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        openCourseDescriptionViewController()
    }
    
    private func openCourseDescriptionViewController() {
        let viewController = CourseDescriptionViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.courseDescription.resolve(CourseDescriptionViewModelProtocol.self)
        rootController.tabBarController?.tabBar.isHidden = true
        rootController.pushViewController(viewController, animated: true)
    }

}
