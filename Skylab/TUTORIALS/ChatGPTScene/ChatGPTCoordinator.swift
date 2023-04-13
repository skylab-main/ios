//
//  ChatGPTCoordinator.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 13/04/2023.
//

import UIKit
import Swinject

class ChatGPTCoordinator: Coordinator {
    
    let rootController: UINavigationController

    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }

    override func start() {
        
        let viewController = ChatGPTViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.chatGPT.resolve(ChatGPTViewModelProtocol.self)
        rootController.pushViewController(viewController, animated: true)
    }
    
    override func finish() {
        
    }
}
