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
        
        container.register(QuizViewModelProtocol.self) { resolver in
            
            let networkManager = Container.networkManager.resolve(NetworkManagerProtocol.self)
            let viewModel = QuizViewModel()
            viewModel.networkManager = networkManager
            
            return viewModel
        }
        
        return container
    }()
}
