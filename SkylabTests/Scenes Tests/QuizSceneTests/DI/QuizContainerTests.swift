//
//  QuizContainerTests.swift
//  SkylabTests
//
//  Created by Aleksey Kotsevych on 18/07/2023.
//

import XCTest
import Swinject
@testable import Skylab

final class QuizContainerTests: XCTestCase {
    
    var container: Container!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        container = Container()
        setupContainerRegistrations()
    }

    override func tearDownWithError() throws {
        
        container = nil
        
        try super.tearDownWithError()
    }

    func setupContainerRegistrations() {
        
        container.register(NetworkManagerProtocol.self) { _ in
            
            return NetworkManager()
        }
        
        container.register(QuizViewModelProtocol.self) { resolver in
            
            let networkManager = resolver.resolve(NetworkManagerProtocol.self)
            let viewModel = QuizViewModel()
            viewModel.networkManager = networkManager
            
            return viewModel
        }
    }
    
    func testQuizTopicsRegistration() {
        
        let viewModel = container.resolve(QuizViewModelProtocol.self)
        
        XCTAssertNotNil(viewModel)
        XCTAssertTrue(viewModel is QuizViewModel)
    }
    
    func testNetworkManagerRegistration() {
        
        let viewModel = container.resolve(QuizViewModelProtocol.self)
        
        XCTAssertNotNil(viewModel?.networkManager)
        XCTAssertTrue(viewModel?.networkManager is NetworkManager)
    }

}
