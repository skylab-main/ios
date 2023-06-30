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
    var moveToNextQuiz: (() -> Void)?
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        
        openQuizQuestionsController()
    }
    
    override func finish() {
        
        removeChildCoordinator(self)
        rootController.popViewController(animated: false)
    }
    
    private func openQuizQuestionsController() {
        
        let viewController = QuizQuestionsViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.quizQuestions.resolve(QuizQuestionsViewModelProtocol.self)
        viewController.viewModel?.setQuizData(quizData)
        
        // Assigning a method to the closure so that it can be called in the 'QuizResultCoordinator' coordinator
        moveToNextQuiz = viewController.viewModel?.goToNextQuiz
        
        viewController.viewModel?.openQuizResultController.asObserver()
            .subscribe(onNext: { data in self.openQuizResultController(with: data) })
            .disposed(by: bag)
        
        rootController.pushViewController(viewController, animated: true)
    }
    
    private func openQuizResultController(with data: QuizResultModel) {
        
        let coordinator = QuizResultCoordinator(rootController)
        coordinator.parentCoordinator = self
        coordinator.resultData = data
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}
