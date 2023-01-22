//
//  ThirdPageCoordinator.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import UIKit

class ThirdPageCoordinator: Coordinator {

    let rootController: UINavigationController

    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }

    override func start() {
        let viewController = ThirdPageViewController.instantiate(coordinator: self)
        viewController.viewModel = ThirdPageViewModel()
        viewController.viewModel?.coordinatorDelegate = self
        rootController.tabBarItem = UITabBarItem(title: "Third",
                                                 image: nil,
                                                 selectedImage: nil)
        rootController.pushViewController(viewController, animated: false)
    }
    
    func openFirstSubcontroller() {
        
    }
    
}

extension ThirdPageCoordinator: ThirdPageViewModelCoordinatorDelegate {
    func openFirstSubControllerDelegate() {
        self.openFirstSubcontroller()
    }
    
    
}
