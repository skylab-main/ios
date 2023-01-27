//
//  FirstPageViewModel.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import Foundation
import RxSwift

class FirstPageViewModel {
    
    // MARK: - Inputs
    let openFirstSubController: AnyObserver<Void>
    let openSecondSubController: AnyObserver<Void>
    
    // MARK: - Outputs
    let didOpenFirstSubController: Observable<Void>
    let didOpenSecondSubController: Observable<Void>
    
    init() {
//        Connection between input and output
        let openFirstSubControllerRX = PublishSubject<Void>()
        self.openFirstSubController = openFirstSubControllerRX.asObserver()
        self.didOpenFirstSubController = openFirstSubControllerRX.asObservable()
        
        let openSecondSubControllerRX = PublishSubject<Void>()
        self.openSecondSubController = openSecondSubControllerRX.asObserver()
        self.didOpenSecondSubController = openSecondSubControllerRX.asObservable()
    }
    

//    var coordinatorDelegate: FirstPageViewModelCoordinatorDelegate?

//    func openFirstSubcontroller() {
//        coordinatorDelegate?.openFirstSubControllerDelegate()
//    }
//
//    func openSecondSubcontroller() {
//        coordinatorDelegate?.openSecondSubControllerDelegate()
//    }
}

//protocol FirstPageViewModelCoordinatorDelegate {
//    func openFirstSubControllerDelegate()
//    func openSecondSubControllerDelegate()
//}
