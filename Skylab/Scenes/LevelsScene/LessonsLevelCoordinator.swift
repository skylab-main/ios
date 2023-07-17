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
    var levelTitle: String?
    
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
        viewController.viewModel?.setLevelTitle(levelTitle)
        viewController.viewModel?.openLessonsVideoController
            .asObserver()
            .subscribe(onNext: { [weak self] levelData in self?.openVideoViewController(with: levelData) })
            .disposed(by: bag)
        
        rootController.pushViewController(viewController, animated: true)
    }
    
    private func openVideoViewController(with data: LevelModel) {
       
        let coordinator = VideoCoordinator(rootController)
        //coordinator..quizData = data
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}
