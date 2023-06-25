//
//  QuizQuestionsCoordinator .swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 17/06/2023.
//

import UIKit
import Swinject
import RxSwift

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
        viewController.viewModel?.openQuizResultController.asObserver()
            .subscribe(onNext: { self.openQuizResultController() })
            .disposed(by: bag)
        rootController.pushViewController(viewController, animated: true)
    }
    
    private func openQuizResultController() {
        
        let coordinator = QuizResultCoordinator(rootController)
        coordinator.start()
    }
}
