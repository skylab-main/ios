//
//  JSONLogger.swift
//  Skylab
//
//  Created by Serhii Dorohobid on 29.01.2023.
//

import Foundation

// Simple implementation of a JSON logger in Swift
class JSONLoggerSwinjectTutorial: LoggerSwinjectTutorialProtocol {
    func log(logLevel: LogLevelSwinjectTutorial, message: String) {
        let jsonData: Data
        let logItem = LogItemSwinjectTutorial(date: Date(), logLevel: logLevel.rawValue, message: message)
        do {
            jsonData = try JSONEncoder().encode(logItem)
        } catch  {
            print("error converting to json: \(error)")
            return
        }
        
        print(String(data: jsonData, encoding: String.Encoding.utf8)!)
    }
}

struct LogItemSwinjectTutorial: Codable {
    var date: Date
    var logLevel: LogLevelSwinjectTutorial.RawValue
    var message: String
}
