//
//  CourseDescriptionCoordinator.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 23/05/2023.
//

import UIKit
import Swinject
import RxSwift

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
        viewController.viewModel?.openCourseDetailsController
            .asObserver()
            .subscribe(onNext: { self.openCourseDetailsViewController() })
            .disposed(by: bag)
        rootController.tabBarController?.tabBar.isHidden = true
        rootController.pushViewController(viewController, animated: true)
    }
    
    private func openCourseDetailsViewController() {
        
        let coordinator = CourseDetailsCoordinator(rootController)
        coordinator.start()
    }

}

