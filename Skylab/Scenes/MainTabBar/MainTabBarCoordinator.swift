//
//  MainTabBarCoordinator.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit

class MainTabBarCoordinator: Coordinator {
    
    let rootTabBarController: UITabBarController
    
    init(_ rootTabBarController: UITabBarController) {
        self.rootTabBarController = rootTabBarController
    }

    override func start() {
        addQuizPage()
        addLessonsPage()
        addPracticePage()
        addAboutPage()
    }
    
    func addQuizPage() {
        let coordinator = QuizCoordinator(UINavigationController())
        rootTabBarController.viewControllers?.append(coordinator.rootController)
        addChildCoordinator(coordinator)
        coordinator.start()
    }

    func addPracticePage() {
        let coordinator = PracticeCoordinator(UINavigationController())
        rootTabBarController.viewControllers?.append(coordinator.rootController)
        addChildCoordinator(coordinator)
        coordinator.start()
    }

    func addLessonsPage() {
        let coordinator = LessonsCoordinator(UINavigationController())
        rootTabBarController.viewControllers?.append(coordinator.rootController)
        addChildCoordinator(coordinator)
        coordinator.start()
    }
    
    func addAboutPage() {
        let coordinator = AboutCoordinator(UINavigationController())
        rootTabBarController.viewControllers?.append(coordinator.rootController)
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}
