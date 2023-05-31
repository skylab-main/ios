//
//  AboutCoordinator.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit
import RxSwift
import Swinject

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
        viewController.viewModel = Container.about.resolve(AboutViewModelProtocol.self)
        viewController.viewModel?.openCourseDescriptionController.asObserver()
            .subscribe(onNext: { [weak self] in self?.openCourseDescriptionViewController() })
            .disposed(by: bag)
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


