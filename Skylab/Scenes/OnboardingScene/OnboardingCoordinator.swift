//
//  OnboardingCoordinator.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import UIKit

class OnboardingCoordinator: Coordinator {

    let rootController: UINavigationController

    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }

    override func start() {
        let viewController = OnboardingViewController.instantiate(coordinator: self)
        viewController.viewModel = OnboardingViewModel()
        rootController.pushViewController(viewController, animated: false)
    }
}

