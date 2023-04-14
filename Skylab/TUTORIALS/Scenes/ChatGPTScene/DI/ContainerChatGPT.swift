//
//  ContainerChatGPT.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 13/04/2023.
//

import Foundation
import Swinject

extension Container {
    
    static let chatGPT = {
        
        let container = Container()

        container.register(ChatGPTViewModelProtocol.self) { _ in
            ChatGPTViewModel()
        }
        
        container.register(ChatGPTResponseViewModelProtocol.self) { _ in
            ChatGPTResponseViewModel()
        }

        return container
    }()
}
