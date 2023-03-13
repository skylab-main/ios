//
//  PlainTextLogger.swift
//  Skylab
//
//  Created by Serhii Dorohobid on 29.01.2023.
//

import Foundation

// Simple implementation of a plain text logger in Swift
class PlainTextLoggerSwinjectTutorial: LoggerSwinjectTutorialProtocol {
    func log(logLevel: LogLevelSwinjectTutorial, message: String) {
        print("\(Date()) [\(logLevel.rawValue)] \(message)")
    }
}
