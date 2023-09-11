//
//  NetworkManagerContainer.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 17/07/2023.
//

import Foundation
import Swinject

extension Container {
    
    static let networkManager = {
        
        let container = Container()
        
        container.register(NetworkManagerProtocol.self) { _ in
            
            NetworkManager()
        }
        
        return container
    }()
}
