//
//  ChatGPTResponseViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 13/04/2023.
//

import Foundation

class ChatGPTResponseViewModel: ChatGPTResponseViewModelProtocol {
    
    var requestDetails: (String, String)?
    
    func sendRequest(completion: @escaping (String) -> Void) {
        
        APICaller.shared.getResponse(input: generateRequest()) { result in
            
            switch result {
            case .success(let response):
                completion(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func generateRequest() -> String {
        
        guard let requestDetails else { return "" }
        
        return "Generate fifteen \(requestDetails.0) tasks on the topic \(requestDetails.1) in Swift"
    }
}
