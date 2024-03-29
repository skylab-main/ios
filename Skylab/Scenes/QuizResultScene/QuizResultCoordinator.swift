//
//  QuizResultCoordinator.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 25/06/2023.
//

import UIKit
import Swinject
import RxSwift

class QuizResultCoordinator: Coordinator {
    
    let rootController: UINavigationController
    var resultData: QuizResultModel?
    weak var parentCoordinator: QuizQuestionsCoordinator?
    private var isAnimate: Bool = false
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        
        openQuizResultController()
    }
    
    override func finish() {
        
        removeChildCoordinator(self)
        rootController.popViewController(animated: isAnimate)
    }
    
    private func openQuizResultController() {
        
        let viewController = QuizResultViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.quizResult.resolve(QuizResultViewModelProtocol.self)
        viewController.viewModel?.setResultData(resultData)
        
        viewController.viewModel?.repeatCurrentQuiz.asObserver()
            .subscribe(onNext: { self.repeatCurrentQuiz() })
            .disposed(by: bag)
        viewController.viewModel?.openAllQuizzes.asObserver()
            .subscribe(onNext: { self.openAllQuizzes() })
            .disposed(by: bag)
        viewController.viewModel?.goToNextQuizz.asObserver()
            .subscribe(onNext: { self.goToNextQuiz() })
            .disposed(by: bag)
        
        rootController.pushViewController(viewController, animated: true)
    }
    
    private func repeatCurrentQuiz() {
        
        isAnimate = true
        finish()
    }
    
    private func openAllQuizzes() {
        
        finish()
        parentCoordinator?.finish()
    }
    
    private func goToNextQuiz() {
        
        guard let moveToNextQuiz = parentCoordinator?.moveToNextQuiz?() else { return }
        
        isAnimate = true
        finish()

        moveToNextQuiz
    }
}
