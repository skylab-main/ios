//
//  QuizResultCoordinator.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 25/06/2023.
//

import UIKit
import Swinject

class QuizResultCoordinator: Coordinator {
    
    let rootController: UINavigationController
    var quizData: QuizTopicsModel?
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        
        openQuizResultController()
    }
    
    private func openQuizResultController() {
        
        let viewController = QuizResultViewController.instantiate(coordinator: self)
        //viewController.viewModel = Container.quizQuestions.resolve(QuizQuestionsViewModelProtocol.self)
        //viewController.viewModel?.quizData = quizData
        rootController.pushViewController(viewController, animated: true)
    }
}
