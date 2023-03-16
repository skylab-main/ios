//
//  SwinjectTestPageCoordinator.swift
//  Skylab
//
//  Created by Serhii Dorohobid on 27.01.2023.
//

import UIKit
import Swinject

class SwinjectTestPageCoordinator: Coordinator {
    let rootController: UINavigationController

    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }

    override func start() {
        let viewController = SwinjectTestPageViewController.instantiate(coordinator: self)
        // Resolve dependency for SwinjectTestPageViewModelProtocol
        viewController.viewModel = Container.tutorial.resolve(SwinjectTestPageViewModelProtocol.self)
        viewController.viewModel?.coordinatorDelegate = self
        rootController.pushViewController(viewController, animated: false)
    }

    func openFirstSubcontroller() {
        let viewController = SwinjectTestPageSubViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.tutorial.resolve(SwinjectTestPageSubViewControllerViewModelProtocol.self)
        rootController.pushViewController(viewController, animated: false)
    }

    func openSecondSubController() {
    }
}

extension SwinjectTestPageCoordinator: SwinjectTestPageViewModelCoordinatorDelegate {
    func openFirstSubControllerDelegate() {
        self.openFirstSubcontroller()
    }

    func openSecondSubControllerDelegate() {
        self.openSecondSubController()
    }
}
