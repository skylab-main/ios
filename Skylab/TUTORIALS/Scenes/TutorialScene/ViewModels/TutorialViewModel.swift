//
//  TutorialViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12/04/2023.
//

import Foundation

class TutorialViewModel: TutorialViewModelProtocol {
    
    var coordinatorDelegate: TutorialCoordinatorDelegate? 
    var topicsArray: [String] = ["RxSwift", "Swinject", "Coordinators", "Chat GPT"]
    
    func openChatGPTViewController(_ topic: String) {
        
        switch topic {
            
        case Topics.rxSwift.rawValue:
            print("Open RxSwift Topic")
        case Topics.swinject.rawValue:
            print("Open Swinject Topic")
        case Topics.coordinators.rawValue:
            print("Open Coordinators Topic")
        case Topics.chatGPT.rawValue:
            coordinatorDelegate?.openChatGPTViewControllerDelegate()
        default: return
        }
        
    }
    
    private enum Topics: String {
        
        case rxSwift = "RxSwift"
        case swinject = "Swinject"
        case coordinators = "Coordinators"
        case chatGPT = "Chat GPT"
    }
}
