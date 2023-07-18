//
//  LessonsCoordinator.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit
import Swinject
import RxSwift

class LessonsCoordinator: Coordinator {
    
    let rootController: UINavigationController
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        openLessonsController()
    }
    
    private func openLessonsController() {
        let viewController = LessonsViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.lessons.resolve(LessonsViewModelProtocol.self)
        
        viewController.viewModel?.openLessonsLevelController
            .asObserver()
            .subscribe(onNext: { [weak self] lessonData in self?.openLessonsLevelController(with: lessonData) })
            .disposed(by: bag)
        
        viewController.viewModel?.openCourseDescriptionController
            .asObserver()
            .subscribe(onNext: { [weak self] in self?.openCourseDescriptionViewController() })
            .disposed(by: bag)
        
        rootController.tabBarItem = UITabBarItem(title: TabBarItems.lessons.rawValue,
                                                 image: TabBarItems.lessons.image,
                                                 selectedImage: TabBarItems.lessons.selectedImage)
        rootController.tabBarItem.setTitleText(font: AnonymousPro.bold(size: 10).font())
        rootController.setViewControllers([viewController], animated: true)
    }
    
    private func openLessonsLevelController(with data: LessonModel) {
       
        let coordinator = LessonsLevelCoordinator(rootController)
        coordinator.levelsData = data.levels
        coordinator.levelTitle = data.levelTitle
        addChildCoordinator(coordinator)
        coordinator.start()
    }
    
    private func openCourseDescriptionViewController() {
        
        let coordinator = CourseDescriptionCoordinator(rootController)
        coordinator.start()
    }
}
