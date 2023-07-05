//
//  QuizResultContainer.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 30/06/2023.
//

import Foundation
import Swinject

extension Container {
    
    static let quizResult = {
        
        let container = Container()
        
        container.register(QuizResultViewModelProtocol.self) { _ in
            
            QuizResultViewModel()
        }
        
        return container
    }()
}
