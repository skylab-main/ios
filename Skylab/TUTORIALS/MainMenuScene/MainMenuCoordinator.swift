//
//  MainMenuCoordinator.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 11/04/2023.
//

import UIKit

class MainMenuCoordinatro: Coordinator {
    
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
        rootController.pushViewController(viewController, animated: false)
    }
    
    override func finish() {
        parentCoordinator.removeChildCoordinator(self)
        parentCoordinator.openTabBar()
    }
}
