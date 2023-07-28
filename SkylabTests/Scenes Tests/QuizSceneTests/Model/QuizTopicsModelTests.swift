//
//  QuizTopicsModelTests.swift
//  SkylabTests
//
//  Created by Aleksey Kotsevych on 16/07/2023.
//

import XCTest
@testable import Skylab

final class QuizTopicsModelTests: XCTestCase {
    
    var sut: QuizTopicsModel!
    var question: Question!
    var quiz: Quiz!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        question = Question(question: "Foo", options: ["Baz"], answer: 0)
        quiz = Quiz(title: "Bar", questions: [question])
        sut = QuizTopicsModel(quizzes: [quiz], chosenTopicTitle: "Baz", progress: 0.5, numberOFCurrentTopic: 1)
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
        question = nil
        quiz = nil
        
        try super.tearDownWithError()
    }
    
    func testInitQuizTopicModelNotNill() {
        
        XCTAssertNotNil(sut)
    }
    
    func testWhenGivenQuizzesSetQuizzes() {
        
        XCTAssertEqual(sut.quizzes, [quiz])
    }
    
    func testWhenGivenChosenTopicTitleSetChosenTopicTitle() {
        
        
        XCTAssertEqual(sut.chosenTopicTitle, "Baz")
    }
    
    func testWhenGivenProgressSetChosenProgress() {
        
        
        XCTAssertEqual(sut.progress, 0.5)
    }
    
    func testWhenGivenNumberOFCurrentTopicSetChosenNumberOFCurrentTopic() {
        
        
        XCTAssertEqual(sut.numberOFCurrentTopic, 1)
    }
}
