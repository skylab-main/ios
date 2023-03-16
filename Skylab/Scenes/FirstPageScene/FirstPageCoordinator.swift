//
//  FirstPageCoordinator.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import UIKit
import RxSwift


class FirstPageCoordinator: Coordinator {
    
    // MARK: Properties
    
    let rootController: UINavigationController

    
    // MARK: Coordinator
    
    init(_ rootController: UINavigationController, parentCoordinator: Coordinator) {
        self.rootController = rootController
    }
    
    override func start() {
        
        let viewController = FirstPageViewController.instantiate(coordinator: self)
        let viewModel = FirstPageViewModel()
        viewController.viewModel = viewModel

        // MARK: - Observe to viewModel and call to func openFirstSubcontroller
        viewModel.didOpenFirstSubController
            .subscribe(onNext: { [weak self] in self?.openFirstSubcontroller()} )
            .disposed(by: bag)
        
        viewModel.didOpenSecondSubController
            .subscribe(onNext: { [weak self] in self?.openSecondSubController()} )
            .disposed(by: bag)
        
        rootController.tabBarItem = UITabBarItem(title: "First",
                                                 image: nil,
                                                 selectedImage: nil)
        rootController.pushViewController(viewController, animated: false)
    }
    
    func openFirstSubcontroller() {
        let viewController = FirstPageSubViewController.instantiate(coordinator: self)
        viewController.viewModel = FirstPageSubViewControllerViewModel()
        viewController.hidesBottomBarWhenPushed = true
        rootController.pushViewController(viewController, animated: false)
    }
    
    func openSecondSubController() {
        let viewController = SecondPageSubViewController.instantiate(coordinator: self)
        viewController.viewModel = SecondPageSubViewControllerViewModel()
        viewController.hidesBottomBarWhenPushed = true
        rootController.pushViewController(viewController, animated: false)
    }
}




