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
    
    func openTRLMenuViewController() {
        
        let viewController = TRLMenuComponentViewController.instantiate(coordinator: self)
        rootController.pushViewController(viewController, animated: true)
    }
}

extension TutorialCoordinator: TutorialCoordinatorDelegate {
    
    func openChatGPTViewControllerDelegate() {
        openChatGPTViewController()
    }
    
    func openTRLMenuViewControllerDelegate() {
        openTRLMenuViewController()
    }
}
