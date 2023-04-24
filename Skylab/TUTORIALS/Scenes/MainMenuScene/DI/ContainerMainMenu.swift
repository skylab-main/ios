//
//  ContainerMainMenu.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12/04/2023.
//

import Foundation
import Swinject

extension Container {
    
    static let mainMenu: Container = {

        let container = Container()

        container.register(MainMenuViewModelProtocol.self) { _ in
            MainMenuViewModel()
        }
        
        container.register(TutorialViewModelProtocol.self) { _ in
            TutorialViewModel()
        }

        return container
    }()
}
