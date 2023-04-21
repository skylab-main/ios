//
//  TutorialViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12/04/2023.
//

import Foundation

class TutorialViewModel: TutorialViewModelProtocol {
    
    var coordinatorDelegate: TutorialCoordinatorDelegate?
    var topicsArray: [String] = {
        let topics = Topics.allCases.reduce(into: [String]()){ result, item in
            result.append(item.rawValue)
        }
        return topics
    }()
    
    func openTopicViewController(_ topic: String) {
        
        switch topic {
            
        case Topics.rxSwift.rawValue:
            print("Open RxSwift Topic")
        case Topics.swinject.rawValue:
            print("Open Swinject Topic")
        case Topics.coordinators.rawValue:
            print("Open Coordinators Topic")
        case Topics.chatGPT.rawValue:
            coordinatorDelegate?.openChatGPTViewControllerDelegate()
        case Topics.dataList.rawValue:
            coordinatorDelegate?.openTRLDataListViewController()
        default: return
        }
        
    }
    
    private enum Topics: String, CaseIterable {
        
        case rxSwift = "RxSwift"
        case swinject = "Swinject"
        case coordinators = "Coordinators"
        case chatGPT = "Chat GPT"
        case dataList = "Data List"
    }
}
