//
//  CourseDescriptionContainer.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 26/05/2023.
//

import Foundation
import Swinject

extension Container {
    
    static let courseDescription = {
        
        let container = Container()
        
        container.register(CourseDescriptionViewModelProtocol.self) { _ in
            CourseDescriptionViewModel()
        }
        
        return container
    }()
}
