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
    var viewModel: ResultCheckViewModelProtocol!
    var solutionData: [String : String]?
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        viewModel = Container.resultCheck.resolve(ResultCheckViewModelProtocol.self)
        viewModel.solutionData = solutionData
        // TODO: - add saved api key cheking
        openAuthorizationAPIViewController()
    }
    
    override func finish() {
        removeChildCoordinator(self)
    }
    
    private func openAuthorizationAPIViewController() {
        let viewController = AuthorizationAPIViewController.instantiate(coordinator: self)
        viewController.viewModel = viewModel
        viewController.viewModel?.openResultCheckController.asObservable()
            .subscribe(onNext: { [weak self] key in
                self?.openResultCheckViewController()
            }).disposed(by: bag)
        viewController.viewModel?.openApiManualDoc.asObservable()
            .subscribe(onNext: { [weak self] _ in
                self?.showWebChatGptDoc()
            }).disposed(by: bag)
        rootController.pushViewController(viewController, animated: true)
    }
    
    private func openResultCheckViewController() {
        let viewController = ResultCheckViewController.instantiate(coordinator: self)
        viewController.viewModel = viewModel
        viewController.viewModel?.goToVideoScene.asObservable()
            .subscribe({ [weak self] _ in
                self?.goToVideoScene()
            }).disposed(by: bag)
        rootController.pushViewController(viewController, animated: true)
    }
    
    private func showWebChatGptDoc() {
        if let url = URL(string: "https://platform.openai.com/docs/api-reference/authentication") {
            let safariViewController = SFSafariViewController(url: url)
            rootController.present(safariViewController, animated: true, completion: nil) }
    }
    
    private func goToVideoScene() {
        if let targetVC = rootController.viewControllers.first(where: { $0 is VideoViewController }) as? VideoViewController {
            rootController.popToViewController(targetVC, animated: true)
            print(childCoordinators.count)
        }
    }
}
