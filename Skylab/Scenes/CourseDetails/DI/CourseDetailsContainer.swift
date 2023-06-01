//
//  CourseDetailsContainer.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 01/06/2023.
//

import Foundation
import Swinject

extension Container {
    
    static let courseDetails = {
        
        let container = Container()
        
        container.register(CourseDetailsViewModelProtocol.self) { _ in
            CourseDetailsViewModel()
        }
        
        return container
    }()
}
