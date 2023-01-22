//
//  FirstPageViewModel.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import Foundation

class FirstPageViewModel {

    var coordinatorDelegate: FirstPageViewModelCoordinatorDelegate?

    func openFirstSubcontroller() {
        coordinatorDelegate?.openFirstSubControllerDelegate()
    }

    func openSecondSubcontroller() {
        coordinatorDelegate?.openSecondSubControllerDelegate()
    }
}

protocol FirstPageViewModelCoordinatorDelegate {
    func openFirstSubControllerDelegate()
    func openSecondSubControllerDelegate()
}
