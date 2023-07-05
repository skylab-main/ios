//
//  VideoCoordinator.swift
//  Skylab
//
//  Created by Сергей Молодец on 05.07.2023.
//

import UIKit
import Swinject
import RxSwift


class VideoCoordinator: Coordinator {
    
    let rootController: UINavigationController
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        openVideoController()
    }
    
    override func finish() {
        removeChildCoordinator(self)
    }
    
    private func openVideoController() {
        let viewController = VideoViewController.instantiate(coordinator: self)
        rootController.pushViewController(viewController, animated: true)
    }
    
}
