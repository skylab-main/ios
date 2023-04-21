//
//  TutorialViewModelProtocol.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12/04/2023.
//

import Foundation

protocol TutorialViewModelProtocol: AnyObject {
    
    var coordinatorDelegate: TutorialCoordinatorDelegate? { get set }
    var topicsArray: [String] { get set }
    
    func openTopicViewController(_ topic: String)
}
