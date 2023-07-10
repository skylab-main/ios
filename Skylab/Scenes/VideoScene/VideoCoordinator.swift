//
//  VideoCoordinator.swift
//  Skylab
//
//  Created by Сергей Молодец on 05.07.2023.
//

import UIKit
import Swinject
import RxSwift
import SafariServices


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
        let lessonsVC = LessonsVideoViewController.instantiate(coordinator: self)
        let tasksVC = TasksViewController.instantiate(coordinator: self)
        viewController.lessonsVC = lessonsVC
        viewController.tasksVC = tasksVC
        lessonsVC.viewModel = Container.videoLessonTask.resolve(VideoViewModelProtocol.self)
        tasksVC.viewModel = Container.videoLessonTask.resolve(VideoViewModelProtocol.self)
        guard let viewModel = lessonsVC.viewModel,
        let downloadLink = viewModel.linkPresentation else { return }
        viewModel.downloadPresentation.asObservable()
            .subscribe { _ in self.showWebContent(url: downloadLink) }
            .disposed(by: bag)
        
        guard let telegramUrl = viewModel.telegramLink else { return }
        viewModel.joinTelegram.asObservable()
            .subscribe { _ in self.showWebContent(url: telegramUrl) }
            .disposed(by: bag)
        rootController.pushViewController(viewController, animated: true)
    }
    
    private func showWebContent(url: URL) {
         let safariViewController = SFSafariViewController(url: url)
        rootController.present(safariViewController, animated: true, completion: nil)
     }
    
}
