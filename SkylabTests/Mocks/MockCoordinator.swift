//
//  MockCoordinator.swift
//  SkylabTests
//
//  Created by Aleksey Kotsevych on 18/07/2023.
//

import Foundation
@testable import Skylab

class MockCoordinator: Coordinator {
    
    var didStart = false
    var didFinish = false
    
    override func start() {
        
        didStart = true
    }
    
    override func finish() {
    
        didFinish = true
    }
}
