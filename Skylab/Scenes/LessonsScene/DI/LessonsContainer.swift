//
//  LessonsContainer.swift
//  Skylab
//
//  Created by Леонід Квіт on 05.07.2023.
//

import Foundation
import Swinject

extension Container {
    
    static let lessons = {
        
        let container = Container()
        
        container.register(LessonsViewModelProtocol.self) { _ in
            LessonsViewModel()
        }
        
        return container
    }()
}
