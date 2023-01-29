//
//  SwinjectPageViewModel.swift
//  Skylab
//
//  Created by Serhii Dorohobid on 27.01.2023.
//

import Foundation

class SwinjectTestPageViewModel: SwinjectTestPageViewModelProtocol {
    var logger: LoggerSwinjectTutorialProtocol
    
    init(logger: LoggerSwinjectTutorialProtocol) {
        self.logger = logger
    }

    var coordinatorDelegate: SwinjectTestPageViewModelCoordinatorDelegate?

    func openFirstSubcontroller() {
        logger.log(logLevel: .debug, message: "openFirstSubcontroller() called")
        coordinatorDelegate?.openFirstSubControllerDelegate()
    }

    func openSecondSubcontroller() {
        coordinatorDelegate?.openSecondSubControllerDelegate()
    }
}
