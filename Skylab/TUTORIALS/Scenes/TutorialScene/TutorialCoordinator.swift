//
//  TutorialCoordinator.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 13/04/2023.
//

import UIKit
import Swinject

class TutorialCoordinator: Coordinator {
    
    let rootController: UINavigationController

    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }

    override func start() {
        
        let viewController = TutorialViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.mainMenu.resolve(TutorialViewModelProtocol.self)
        viewController.viewModel?.coordinatorDelegate = self
        rootController.pushViewController(viewController, animated: true)
    }
    
    override func finish() {
        
    }
    
    //MARK: - Child controller
    
    func openChatGPTViewController() {
        
        let coordinator = ChatGPTCoordinator(rootController)
        coordinator.start()
    }
    
}

extension TutorialCoordinator: TutorialCoordinatorDelegate {
    
    func openTRLDataListViewController() {
        let coordinator = TRLDataListCoordinator(rootController: rootController, parentCoordinator: self)
        coordinator.start()
        self.addChildCoordinator(coordinator)
    }
    
    
    func openChatGPTViewControllerDelegate() {
        openChatGPTViewController()
    }
    
}
