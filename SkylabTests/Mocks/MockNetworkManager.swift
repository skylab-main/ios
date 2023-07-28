//
//  NetworkManagerMock.swift
//  SkylabTests
//
//  Created by Aleksey Kotsevych on 16/07/2023.
//

import Foundation
@testable import Skylab

class MockNetworkManager: NetworkManagerProtocol {
    
    var getQuizCallCount = 0
    private let questions = Question(question: "Bar", options: ["Baz"], answer: 1)
    private lazy var mockData = [Quiz(title: "Foo", questions: [questions])]
    
    func getQuiz(completion: @escaping ([Quiz]) -> ()) {
        
        getQuizCallCount += 1
        
        completion(self.mockData)
    }
}
