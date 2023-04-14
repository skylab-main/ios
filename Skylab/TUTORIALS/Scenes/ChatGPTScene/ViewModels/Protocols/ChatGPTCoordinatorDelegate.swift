//
//  ChatGPTCoordinatorDelegate.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 14/04/2023.
//

import Foundation

protocol ChatGPTCoordinatorDelegate: AnyObject {
    
    func openChatGPTResponseViewControllerDelegate(with request: (String, String))
}
