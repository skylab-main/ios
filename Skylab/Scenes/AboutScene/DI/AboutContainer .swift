//
//  AboutContainer .swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 31/05/2023.
//

import Foundation
import Swinject

extension Container {
    
    static let about = {
        
        let container = Container()
        
        container.register(AboutViewModelProtocol.self) { _ in
            AboutViewModel()
        }
        
        return container
    }()
}

