//
//  ChatGPTViewModelProtocol.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 13/04/2023.
//

import Foundation

protocol ChatGPTViewModelProtocol: AnyObject {

    var coordinatorDelegate: ChatGPTCoordinatorDelegate? { get set }
    var topicsArray: [String] { get set }
    
    func openChatGPTResponseViewController(with request: (String, String))
}
