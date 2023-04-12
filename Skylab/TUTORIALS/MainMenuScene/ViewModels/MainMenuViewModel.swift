//
//  MainMenuViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12/04/2023.
//

import Foundation

class MainMenuViewModel: MainMenuViewModelProtocol {
    
    weak var coordinatorDelegate: MainMenuCoordinatorDelegate?
    
    func openViewController(tag: Int) {
        
        switch tag {
        case 0:
            coordinatorDelegate?.openApplicationViewController()
        case 1:
            coordinatorDelegate?.openTutorialViewController()
        default: return
        }
    }
    
}
