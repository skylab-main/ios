//
//  OnboardingViewModel.swift
//  Skylab
//
//  Created by Artem Bilyi on 16.02.2023.
//

import Foundation

class OnboardingViewModel {

    var coordinatorDelegate: OnboardingCoordinatorDelegate?

    func openAuthorizationController() {
        coordinatorDelegate?.openAuthorizationControllerDelegate()
    }
}

protocol OnboardingCoordinatorDelegate {
    func openAuthorizationControllerDelegate()
}
