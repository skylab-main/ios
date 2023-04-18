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
        viewController.viewModel?.coordinatorDelegate = self
        rootController.pushViewController(viewController, animated: true)
    }
    
    override func finish() {
        
    }
    
    //MARK: - Child controller
    
    func openChatGPTResponseViewController(with request: (String, String)) {
        
        let viewController = ChatGPTResponseViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.chatGPT.resolve(ChatGPTResponseViewModelProtocol.self)
        viewController.viewModel?.requestDetails = request
        rootController.pushViewController(viewController, animated: true)
    }
}

//MARK: - Extensions

extension ChatGPTCoordinator: ChatGPTCoordinatorDelegate {
    
    func openChatGPTResponseViewControllerDelegate(with request: (String, String)) {
        openChatGPTResponseViewController(with: request)
    }
    
}
