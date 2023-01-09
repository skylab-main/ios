//
//  FirstPageCoordinator.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import UIKit

class FirstPageCoordinator: Coordinator {

    // MARK: Properties

    let rootController: UINavigationController

    // MARK: Coordinator

    init(_ rootController: UINavigationController, parentCoordinator: Coordinator) {
        self.rootController = rootController
    }

    override func start() {

        let viewController = FirstPageViewController.instantiate(coordinator: self)
        viewController.viewModel = FirstPageViewModel()
        viewController.viewModel?.coordinatorDelegate = self
        rootController.tabBarItem = UITabBarItem(title: "First",
                                                 image: nil,
                                                 selectedImage: nil)
        rootController.pushViewController(viewController, animated: false)
    }

    func openFirstSubcontroller() {
        let viewController = FirstPageSubViewController.instantiate(coordinator: self)
        viewController.viewModel = FirstPageSubViewControllerViewModel()
        rootController.pushViewController(viewController, animated: false)
    }

    func openSecondSubController() {

    }
}

extension FirstPageCoordinator: FirstPageViewModelCoordinatorDelegate {

    func openFirstSubControllerDelegate() {
        self.openFirstSubcontroller()
    }

    func openSecondSubControllerDelegate() {
        self.openSecondSubController()
    }
}



