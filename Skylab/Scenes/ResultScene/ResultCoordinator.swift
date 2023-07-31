//
//  ResultCoordinator.swift
//  Skylab
//
//  Created by Сергей Молодец on 29.07.2023.
//

import UIKit
import Swinject

class ResultCoordinator: Coordinator {
    
    let rootController: UINavigationController
    var solutionData: String?
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        openAuthorizationAPIViewController()
    }
    
    override func finish() {
        removeChildCoordinator(self)
    }
    
    private func openAuthorizationAPIViewController() {
        let viewController = AuthorizationAPIViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.resultCheck.resolve(ResultCheckViewModelProtocol.self)
        rootController.pushViewController(viewController, animated: true)
    }
    
}
