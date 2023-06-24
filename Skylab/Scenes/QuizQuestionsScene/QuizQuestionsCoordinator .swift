//
//  QuizQuestionsCoordinator .swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 17/06/2023.
//

import UIKit
import Swinject

class QuizQuestionsCoordinator: Coordinator {
    
    let rootController: UINavigationController
    var quizData: QuizTopicsModel?
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        
        openQuizQuestionsController()
    }
    
    private func openQuizQuestionsController() {
        
        let viewController = QuizQuestionsViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.quizQuestions.resolve(QuizQuestionsViewModelProtocol.self)
        viewController.viewModel?.quizData = quizData
        rootController.pushViewController(viewController, animated: true)
    }
}
