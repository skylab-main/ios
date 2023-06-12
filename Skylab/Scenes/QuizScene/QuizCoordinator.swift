//
//  QuizCoordinator.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit

class QuizCoordinator: Coordinator {
    
    let rootController: UINavigationController
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        openQuizController()
    }
    
    private func openQuizController() {
        let viewController = QuizViewController.instantiate(coordinator: self)
        let viewModel = QuizViewModel()
        viewController.viewModel = viewModel
        rootController.tabBarItem = UITabBarItem(title: TabBarItems.quiz.rawValue,
                                                 image: TabBarItems.quiz.image,
                                                 selectedImage: TabBarItems.quiz.selectedImage)
        rootController.tabBarItem.setTitleText(font: AnonymousPro.bold(size: 10).font())
        rootController.pushViewController(viewController, animated: true)
    }
}
