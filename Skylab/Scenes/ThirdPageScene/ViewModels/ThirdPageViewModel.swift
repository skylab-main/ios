//
//  ThirdPageViewModel.swift
//  Skylab
//
//  Created by Сергей Молодец on 16.01.2023.
//

import Foundation

class ThirdPageViewModel {
    
    var coordinatorDelegate: ThirdPageViewModelCoordinatorDelegate?
    
    func openFirstSubcontroller() {
        coordinatorDelegate?.openFirstSubControllerDelegate()
    }
}

protocol ThirdPageViewModelCoordinatorDelegate {
    func openFirstSubControllerDelegate()
}
