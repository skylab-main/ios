//
//  TestMenuViewCoordinator.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.03.2023.
//

import UIKit

class TestMenuViewCoordinator: Coordinator {
    let rootController: UINavigationController

    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }

    override func start() {
        let viewController = TestMenuViewController.instantiate(coordinator: self)
        rootController.pushViewController(viewController, animated: false)
    }
}
