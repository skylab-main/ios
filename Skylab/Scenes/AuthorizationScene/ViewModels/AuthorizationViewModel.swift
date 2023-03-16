//
//  AuthorizationViewModel.swift
//  Skylab
//
//  Created by Artem Tkachenko on 16.02.2023.
//

import Foundation

class AuthorizationViewModel {
    
    var coordinatorDelegate: AuthorizationViewModelCoordinatorDelegate?
    
    func openFirstSubcontroller() {
        coordinatorDelegate?.openTabBarControllerDelegate()
    }
}

protocol AuthorizationViewModelCoordinatorDelegate {
    func openTabBarControllerDelegate()
}

