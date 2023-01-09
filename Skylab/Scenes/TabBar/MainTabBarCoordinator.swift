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

    // MARK: - Coordinator

    init(_ rootTabBarController: UITabBarController) {
        self.rootTabBarController = rootTabBarController
    }

    override func start() {

        addFirstPage()
        addSecondPage()
        addThirdPage()
    }

    func addFirstPage() {
        let coordinator = FirstPageCoordinator(UINavigationController(),
                                               parentCoordinator: self)
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
