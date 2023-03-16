//
//  AuthorizationCoordinator.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import UIKit

class AuthorizationCoordinator: Coordinator {

    let rootController: UINavigationController

    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }

    override func start() {
        let viewController = AuthorizationViewController.instantiate(coordinator: self)
        viewController.viewModel = AuthorizationViewModel()
        rootController.pushViewController(viewController, animated: false)
    }
}
