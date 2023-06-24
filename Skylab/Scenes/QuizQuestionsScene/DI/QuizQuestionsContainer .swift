//
//  QuizQuestionsContainer .swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 21/06/2023.
//

import Foundation
import Swinject

extension Container {
    
    static let quizQuestions = {
        
        let container = Container()
        
        container.register(QuizQuestionsViewModelProtocol.self) { _ in
            
            QuizQuestionsViewModel()
        }
        
        return container
    }()
}
