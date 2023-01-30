//
//  SecondPageCoordinator.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import UIKit
import SwiftUI
import RxSwift

class SecondPageCoordinator: Coordinator {
    
    let rootController: UINavigationController
    
//    Resource managment RxSwift
    let bag = DisposeBag()
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        
        let viewModel = SecondPageSwiftUIViewModel()
        
//        Observe on viewModel emits
        viewModel.openSecondSubControllerDidTap.asObservable()
            .subscribe(onNext: { [weak self] in self?.openFirstSubcontroller() })
            .disposed(by: bag)
          
//        integrate SwiftUI view into a UIKit view hierarchy
        let swiftUIController = UIHostingController(rootView: SecondPageSwiftUIView(viewModel: viewModel))
        
//        changed to RxSwift
        //        let viewController = SecondPageViewController.instantiate(coordinator: self)
        //        viewController.viewModel = SecondPageViewModel()
        //        viewController.viewModel?.coordinatorDelegate = self
        rootController.tabBarItem = UITabBarItem(title: "Second",
                                                 image: nil,
                                                 selectedImage: nil)
        rootController.pushViewController(swiftUIController, animated: false)
    }
    
    func openFirstSubcontroller() {
        let viewController = SecondPageSubViewController.instantiate(coordinator: self)
        viewController.viewModel = SecondPageSubViewControllerViewModel()
        viewController.hidesBottomBarWhenPushed = true
        rootController.pushViewController(viewController, animated: false)
    }
}

//        changed to RxSwift
//extension SecondPageCoordinator: SecondPageViewModelCoordinatorDelegate {
//
//    func openFirstSubControllerDelegate() {
//        self.openFirstSubcontroller()
//    }
//}
