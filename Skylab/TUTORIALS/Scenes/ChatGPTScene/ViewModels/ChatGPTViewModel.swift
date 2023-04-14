//
//  ChatGPTViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 13/04/2023.
//

import Foundation

class ChatGPTViewModel: ChatGPTViewModelProtocol {
    
    var coordinatorDelegate: ChatGPTCoordinatorDelegate?
    var topicsArray: [String] = ["Classes", "Protocols", "Optionals", "Generics", "Enums", "OOP", "POP", "Structures"]
    
    func openChatGPTResponseViewController(with request: (String, String)) {
        
        APICaller.shared.setup()
        
        coordinatorDelegate?.openChatGPTResponseViewControllerDelegate(with: request)
    }
}
