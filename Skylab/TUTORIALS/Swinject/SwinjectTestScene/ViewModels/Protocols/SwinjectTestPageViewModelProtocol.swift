//
//  SwinjectTestPageViewModelProtocol.swift
//  Skylab
//
//  Created by Serhii Dorohobid on 12.03.2023.
//

import Foundation

protocol SwinjectTestPageViewModelProtocol {
    var logger: LoggerSwinjectTutorialProtocol {get}
    var coordinatorDelegate: SwinjectTestPageViewModelCoordinatorDelegate? {get set}

    func openFirstSubcontroller()
    func openSecondSubcontroller()
}
