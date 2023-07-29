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
    var lessonData: LevelModel?
    
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
        guard let lessonData else { return }
        lessonsVC.viewModel?.setLessonData(lessonData)
        tasksVC.viewModel = Container.videoLessonTask.resolve(VideoViewModelProtocol.self)
        tasksVC.viewModel?.setLessonData(lessonData)
        
        guard let lessonViewModel = lessonsVC.viewModel,
        let downloadLink = lessonViewModel.linkPresentation else { return }
        lessonViewModel.downloadPresentation.asObservable()
            .subscribe { _ in self.showWebContent(url: downloadLink) }
            .disposed(by: bag)
        
        guard let telegramUrl = lessonViewModel.telegramLink else { return }
        lessonViewModel.joinTelegram.asObservable()
            .subscribe { _ in self.showWebContent(url: telegramUrl) }
            .disposed(by: bag)
        
        guard let taskViewModel = tasksVC.viewModel else { return }
        taskViewModel.solution.asObservable()
            .subscribe { solution in
                self.goToCheckResultScene(with: solution)
            }.disposed(by: bag)
        rootController.pushViewController(viewController, animated: true)
    }
    
    private func showWebContent(url: URL) {
         let safariViewController = SFSafariViewController(url: url)
        rootController.present(safariViewController, animated: true, completion: nil)
     }
    
    private func goToCheckResultScene(with data: String) {
        let coordinator = ResultCoordinator(rootController)
        addChildCoordinator(coordinator)
        coordinator.solutionData = data
        coordinator.start()
    }
}
