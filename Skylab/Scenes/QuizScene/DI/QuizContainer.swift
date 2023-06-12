//
//  QuizContainer.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12/06/2023.
//

import Foundation
import Swinject

extension Container {
    
    static let quizTopics = {
        
        let container = Container()
        
        container.register(QuizViewModelProtocol.self) { _ in
            QuizViewModel()
        }
        
        return container
    }()
}
