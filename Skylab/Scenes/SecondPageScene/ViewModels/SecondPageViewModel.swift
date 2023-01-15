//
//  SecondPageViewModel.swift
//  Skylab
//
//  Created by Serhii Dorohobid on 15.01.2023.
//

import Foundation

class SecondPageViewModel {

    var coordinatorDelegate: SecondPageViewModelCoordinatorDelegate?

    func openFirstSubcontroller() {
        coordinatorDelegate?.openFirstSubControllerDelegate()
    }
}

protocol SecondPageViewModelCoordinatorDelegate {
    func openFirstSubControllerDelegate()
}
