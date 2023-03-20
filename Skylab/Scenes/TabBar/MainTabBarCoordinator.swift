//
//  MainTabBarCoordinator.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import UIKit

class MainTabBarCoordinator: Coordinator {

    // MARK: - Properties

    let rootTabBarController: UITabBarController
    let featureToggleProvider: FeatureToggleProvider

    // MARK: - Coordinator

    init(_ rootTabBarController: UITabBarController, featureToggleProvider:FeatureToggleProvider) {
        self.rootTabBarController = rootTabBarController
        self.featureToggleProvider = featureToggleProvider
        
    }

    override func start() {

        addFirstPage()
        addSecondPage()
        addThirdPage()
    }

    func addFirstPage() {
        let coordinator = FirstPageCoordinator(UINavigationController(),
                                               parentCoordinator: self, featureToggleProvider: featureToggleProvider)
        rootTabBarController.viewControllers?.append(coordinator.rootController)
        addChildCoordinator(coordinator)
        coordinator.start()
    }

    func addSecondPage() {
        let coordinator = SecondPageCoordinator(UINavigationController())
        rootTabBarController.viewControllers?.append(coordinator.rootController)
        addChildCoordinator(coordinator)
        coordinator.start()
    }

    func addThirdPage() {
        let coordinator = ThirdPageCoordinator(UINavigationController())
        rootTabBarController.viewControllers?.append(coordinator.rootController)
        addChildCoordinator(coordinator)
        coordinator.start()
    }

    override func finish() {
        // Clean up any view controllers. Pop them of the navigation stack for example.
//        delegate?.didFinish(from: self)
    }

}
