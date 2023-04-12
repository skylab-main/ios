//
//  MainMenuViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12/04/2023.
//

import Foundation

class MainMenuViewModel: MainMenuViewModelProtocol {
    
    weak var coordinator: MainMenuCoordinatorProtocol?
    
    init(coordinator: MainMenuCoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }
    
    func openViewController(tag: Int) {
        
        switch tag {
        case 0:
            coordinator?.openApplicationViewController()
        case 1:
            coordinator?.openTutorialViewController()
        default: return
        }
    }
    
}
