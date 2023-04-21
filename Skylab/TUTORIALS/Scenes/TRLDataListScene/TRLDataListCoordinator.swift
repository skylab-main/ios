//
//  TRLDataListCoordinator.swift
//  Skylab
//
//  Created by Liza on 19.04.2023.
//

import UIKit


class TRLDataListCoordinator: Coordinator {
    
    let rootController: UINavigationController
    
    let parentCoordinator: Coordinator
    
    init(rootController: UINavigationController, parentCoordinator: Coordinator) {
        self.rootController = rootController
        self.parentCoordinator = parentCoordinator
    }
    
    override func start() {
        let viewController = TRLDataListViewController.instantiate(coordinator: self)
        let viewModel = TRLDataListViewModel()
        viewController.viewModel = viewModel
        rootController.pushViewController(viewController, animated: false)
    }
    
    override func finish() {
        parentCoordinator.removeChildCoordinator(self)
    }
    
}
