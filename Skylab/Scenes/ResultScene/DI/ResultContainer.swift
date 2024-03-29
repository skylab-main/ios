//
//  ResultContainer.swift
//  Skylab
//
//  Created by Сергей Молодец on 31.07.2023.
//

import Foundation
import Swinject

extension Container {
    
    static let resultCheck = {
        
        let container = Container()
        
        container.register(ResultCheckViewModelProtocol.self) { _ in
            let keychainManager = Container.keychainManager.resolve(KeychainManagerProtocol.self)
            
            return ResultCheckViewModel(keychainManager: keychainManager)
        }
        return container
    }()
}
