//
//  QuizViewModelTests.swift
//  SkylabTests
//
//  Created by Aleksey Kotsevych on 16/07/2023.
//

import XCTest
import RxSwift
@testable import Skylab

final class QuizViewModelTests: XCTestCase {
    
    var sut: QuizViewModelProtocol!
    var networkManager: NetworkManagerProtocol!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        networkManager = MockNetworkManager()
        sut = QuizViewModel()
        sut.networkManager = networkManager
    }
    
    override func tearDownWithError() throws {
    
        networkManager = nil
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testSetQuizTopics_ShouldSetData() {
        
        // Given
        let mockData = setUpMockData()
        
        // When
        sut.setQuizTopics(with: mockData)
        let quizTopicsArray = sut.getQuizTopicData()
        
        // Then
        XCTAssertEqual(mockData, quizTopicsArray)
    }
    
    func testGetQuizTopics_WhenQuizDataReceived_ShouldUpdateQuizTopicsArray() {
        
        // Given
        let questions = Question(question: "Bar", options: ["Baz"], answer: 1)
        let mockData = [Quiz(title: "Foo", questions: [questions])]
        
        // When
        sut.getQuizTopics()
        let quizTopicsArray = sut.getQuizTopicData()
        
        // Then
        XCTAssertEqual(sut.getNumberOfRowsInSection(), mockData.count)
        XCTAssertEqual(quizTopicsArray.first?.quizzes, mockData)
    }
    
    func testGetQuizTopicsData_ShouldReturnsQuizTopicsArray() {
        
        // Given
        let mockData = setUpMockData()
        
        // When
        sut.setQuizTopics(with: mockData)
        let quizTopicsArray = sut.getQuizTopicData()
        
        // Then
        XCTAssertEqual(quizTopicsArray, mockData)
        
    }
    
    func testGetNumberOfRowsInSection_ShouldReturnsCorrectNumberOfRowsInSection() {
        
        // Given
        let mockData = setUpMockData()
        
        // When
        sut.setQuizTopics(with: mockData)
        
        // Then
        XCTAssertEqual(mockData.count, self.sut.getNumberOfRowsInSection())
        
    }
    
    func testUpdateTopicData_UpdatesQuizTopicsArray() {
        
        // Gived
        sut.getQuizTopics()
        var quizTopicsArray = sut.getQuizTopicData()
        
        XCTAssertEqual(quizTopicsArray.count, 1)
        
        // When
        sut.updateTopicData()
        
        let mockData = setUpMockData()
        
        sut.setQuizTopics(with: mockData)
        
        quizTopicsArray = sut.getQuizTopicData()
        
        // Then
        XCTAssertEqual(quizTopicsArray.count, 2)
    }
}

//MARK: - Extensions 

extension QuizViewModelTests {
    
    func setUpMockData() -> [QuizTopicsModel] {
        
        let question = Question(question: "Foo", options: ["Baz"], answer: 0)
        let quiz = Quiz(title: "Bar", questions: [question])
        let mockData: [QuizTopicsModel]  = [QuizTopicsModel(quizzes: [quiz],
                                                            chosenTopicTitle: "Baz",
                                                            progress: 0.5,
                                                            numberOFCurrentTopic: 1)]
        
        return mockData
    }
}
