//
//  CourseDetailsCoordinator.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 01/06/2023.
//

import UIKit
import Swinject

class CourseDetailsCoordinator: Coordinator {
    
    let rootController: UINavigationController
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        
        openCourseDetailsViewController()
    }
    
    private func openCourseDetailsViewController() {
        
        let viewController = CourseDetailsViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.courseDetails.resolve(CourseDetailsViewModelProtocol.self)
        rootController.tabBarController?.tabBar.isHidden = true
        rootController.pushViewController(viewController, animated: true)
    }
    
}
