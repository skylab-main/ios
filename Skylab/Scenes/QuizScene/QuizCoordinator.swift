//
//  QuizCoordinator.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12.04.2023.
//

import UIKit
import Swinject
import RxSwift

class QuizCoordinator: Coordinator {
    
    let rootController: UINavigationController
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        
        openQuizController()
    }
    
    override func finish() {
        
        removeChildCoordinator(self)
        rootController.removeFromParent()
    }
    
    private func openQuizController() {
        
        let viewController = QuizViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.quizTopics.resolve(QuizViewModelProtocol.self)
        
        viewController.viewModel?.openQuizQuestionsController
            .asObserver()
            .subscribe(onNext: { [weak self] quizData in self?.openQuizQuestionsController(with: quizData) })
            .disposed(by: bag)
        
        rootController.tabBarItem = UITabBarItem(title: TabBarItems.quiz.rawValue,
                                                 image: TabBarItems.quiz.image,
                                                 selectedImage: TabBarItems.quiz.selectedImage)
        rootController.tabBarItem.setTitleText(font: AnonymousPro.bold(size: 10).font())
        rootController.pushViewController(viewController, animated: true)
    }
    
    private func openQuizQuestionsController(with data: QuizTopicsModel) {
       
        let coordinator = QuizQuestionsCoordinator(rootController)
        coordinator.quizData = data
        addChildCoordinator(coordinator)
        coordinator.start()
    }
    
}
