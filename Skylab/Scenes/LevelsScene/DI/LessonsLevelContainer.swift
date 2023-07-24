//
//  LessonsLevelContainer.swift
//  Skylab
//
//  Created by Леонід Квіт on 13.07.2023.
//

import Foundation
import Swinject

extension Container {
    
    static let levels = {
        
        let container = Container()
        
        container.register(LessonsLevelViewModelProtocol.self) { _ in
            LessonsLevelViewModel()
        }
        
        return container
    }()
}
