//
//  LessonsLevelCoordinator.swift
//  Skylab
//
//  Created by Леонід Квіт on 13.07.2023.
//

import UIKit
import Swinject
import RxSwift

class LessonsLevelCoordinator: Coordinator {
    
    let rootController: UINavigationController
    var levelsData: LevelsModel?
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        openLessonsLevelController()
    }
    
    private func openLessonsLevelController() {
        let viewController = LessonsLevelViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.levels.resolve(LessonsLevelViewModelProtocol.self)
        viewController.viewModel?.setLevels(levelsData)
//        viewController.viewModel?.openLessonsLevelController
//            .asObserver()
//            .subscribe(onNext: { [weak self] lessonsData in self?.openLessonsLevelController(with: lessonsData) })
//            .disposed(by: bag)
        
//        rootController.tabBarItem = UITabBarItem(title: TabBarItems.lessons.rawValue,
//                                                 image: TabBarItems.lessons.image,
//                                                 selectedImage: TabBarItems.lessons.selectedImage)
//        rootController.tabBarItem.setTitleText(font: AnonymousPro.bold(size: 10).font())
        //rootController.setViewControllers([viewController], animated: true)
        rootController.pushViewController(viewController, animated: true)
    }
    
//    private func openLessonsLevelController(with data: LevelsModel) {
//       
//        let coordinator = QuizQuestionsCoordinator(rootController)
//        coordinator.quizData = data
//        addChildCoordinator(coordinator)
//        coordinator.start()
//    }
}
