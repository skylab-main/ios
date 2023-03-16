//
//  OnboardingCoordinator.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import UIKit
import RxSwift

class OnboardingCoordinator: Coordinator {

    let rootController: UINavigationController
    let parentCoordinator:AppCoordinator

    init(_ rootController: UINavigationController,parentCoordinatoor:AppCoordinator) {
        self.rootController = rootController
        self.parentCoordinator = parentCoordinatoor
    }

    override func start() {
        let viewController = OnboardingViewController.instantiate(coordinator: self)
        let viewModel = OnboardingViewModel()
        viewController.viewModel = viewModel
        viewModel.didFetchValues.asObservable().subscribe(onNext: {[weak self] in
            self?.finish()}).disposed(by: bag)
        
        rootController.pushViewController(viewController, animated: false)
    }
    override func finish() {
        parentCoordinator.removeChildCoordinator(self)
        parentCoordinator.openTabBar()
    }
}

