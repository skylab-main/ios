//
//  KeychainManagerContainer.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 08/09/2023.
//

import Foundation
import Swinject

extension Container {
    
    static var keychainManager = {
        let container = Container()
        
        container.register(KeychainManagerProtocol.self) { _ in
            KeychainManager()
        }
        
        return container
    }()
}
