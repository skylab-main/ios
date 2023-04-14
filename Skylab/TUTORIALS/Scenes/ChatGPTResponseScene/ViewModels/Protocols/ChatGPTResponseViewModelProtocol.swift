//
//  ChatGPTResponseViewModelProtocol.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 13/04/2023.
//

import Foundation

protocol ChatGPTResponseViewModelProtocol: AnyObject {
    
    var requestDetails: (String, String)? { get set }
    
    func sendRequest(completion: @escaping (String) -> Void)
}
