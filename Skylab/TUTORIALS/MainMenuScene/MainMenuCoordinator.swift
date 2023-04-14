//
//  MainMenuCoordinator.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 11/04/2023.
//

import UIKit
import Swinject

class MainMenuCoordinator: Coordinator {
    
    let rootController: UINavigationController
    let featureToggleProvider:FeatureToggleProvider
    let parentCoordinator:AppCoordinator

    init(_ rootController: UINavigationController,parentCoordinatoor:AppCoordinator, featureToggleProvider:FeatureToggleProvider) {
        self.rootController = rootController
        self.parentCoordinator = parentCoordinatoor
        self.featureToggleProvider = featureToggleProvider
    }

    override func start() {
        
        let viewController = MainMenuViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.mainMenu.resolve(MainMenuViewModelProtocol.self)
        viewController.viewModel?.coordinatorDelegate = self
        rootController.pushViewController(viewController, animated: false)
    }
    
    override func finish() {
        
        parentCoordinator.removeChildCoordinator(self)
    }
    
    //MARK: - Child controller
    
    func openApplicationViewController() {
        
        let viewController = ApplicationViewController.instantiate(coordinator: self)
        rootController.pushViewController(viewController, animated: true)
    }
    
    func openTutorialViewController() {
        
        let coordinator = TutorialCoordinator(rootController)
        coordinator.start()
    }
    
}

//MARK: - Extensions

extension MainMenuCoordinator: MainMenuCoordinatorDelegate {
    
    func openApplicationViewControllerDelegate() {
        openApplicationViewController()
    }
    
    func openTutorialViewControllerDelegate() {
        openTutorialViewController()
    }
}
