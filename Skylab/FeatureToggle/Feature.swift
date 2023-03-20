//
//  Feature.swift
//  Skylab
//
//  Created by Liza on 20.03.2023.
//

import Foundation

enum Feature: String, CaseIterable {
    case toggleLabel
    
    var isEnabled: Bool {
        switch self {
        default:
            return false
        }
    }
}
