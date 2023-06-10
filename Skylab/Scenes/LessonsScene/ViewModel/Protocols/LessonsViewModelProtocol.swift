//
//  LessonsViewModelProtocol.swift
//  Skylab
//
//  Created by Леонід Квіт on 01.06.2023.
//

import Foundation

protocol LessonsViewModelProtocol: AnyObject {
    
    var coordinatorDelegate: LessonsCoordinatorDelegate? { get set }
    var lessonsArray: [String] { get set }
    
    func openLevelViewController(_ lesson: String)
}
