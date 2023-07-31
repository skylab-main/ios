//
//  ResultCoordinator.swift
//  Skylab
//
//  Created by Сергей Молодец on 29.07.2023.
//

import UIKit
import Swinject
import SafariServices

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
        viewController.viewModel?.openResultCheckController.asObservable()
            .subscribe({ [weak self] key in
                self?.openResultCheckViewController()
            }).disposed(by: bag)
        viewController.viewModel?.openApiManualDoc.asObservable()
            .subscribe({ [weak self] _ in
                self?.showWebChatGptDoc()
            }).disposed(by: bag)

        rootController.pushViewController(viewController, animated: true)
    }
    
    private func openResultCheckViewController() {
        let viewController = ResultCheckViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.resultCheck.resolve(ResultCheckViewModelProtocol.self)
        rootController.pushViewController(viewController, animated: true)
    }
    
    private func showWebChatGptDoc() {
        if let url = URL(string: "https://platform.openai.com/docs/api-reference/authentication") {
            let safariViewController = SFSafariViewController(url: url)
            rootController.present(safariViewController, animated: true, completion: nil) }
     }
}
