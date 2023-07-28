//
//  QuizCoordinatorTests.swift
//  SkylabTests
//
//  Created by Aleksey Kotsevych on 18/07/2023.
//

import XCTest
@testable import Skylab

final class QuizCoordinatorTests: XCTestCase {
    
    var sut: Coordinator!
    var mockViewModel: MockQuizViewModel!
    var navigationController: UINavigationController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockViewModel = MockQuizViewModel()
        navigationController = UINavigationController()
        sut = QuizCoordinator(navigationController)
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
        mockViewModel = nil
        navigationController = nil
        
        try super.tearDownWithError()
    }
    
    func testStart_QuizViewControllerPushed()  {
        
        sut.start()
        
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.topViewController is QuizViewController)
    }
    
    func testStart_SubscribeToOpenQuizQuestionsController() {
        
        sut.start()
        
        // When
        mockViewModel.triggerOpenQuizQuestionsController()
        mockViewModel.openQuizQuestionsController.onNext(setUpMockData().first!)
        
        // Then
        XCTAssertTrue(mockViewModel.openQuizQuestionsControllerCalled)
    }
    
    func testFinish_ChildCoordinatorsRemoved() {
        
        // Given
        sut.start()
        XCTAssertFalse(sut.childCoordinators.isEmpty)
        
        // When
        sut.finish()
        
        // Then
        XCTAssertTrue(sut.childCoordinators.isEmpty)
    }
    
    func testAddChildCoordinator_ChildCoordinatorAdded() {
        
        // Given
        let mockChildCoordinator = MockCoordinator()
        
        // When
        sut.addChildCoordinator(mockChildCoordinator)
        
        // Then
        XCTAssertTrue(sut.childCoordinators.contains(mockChildCoordinator))
    }
    
    func testRemoveChildCoordinator_ChildCoordinatorRemoved() {
        
        // Given
        let mockChildCoordinator = MockCoordinator()
        
        // When
        sut.addChildCoordinator(mockChildCoordinator)
        sut.removeChildCoordinator(mockChildCoordinator)
        
        // Then
        XCTAssertFalse(sut.childCoordinators.contains(mockChildCoordinator))
    }
    
    func testStart_MultipleCalls_DoNotDuplicateViewControllers() {
        // Given
        sut.start()
        let initialViewControllerCount = navigationController.viewControllers.count
        
        // When
        sut.start()
        
        // Then
        XCTAssertEqual(navigationController.viewControllers.count, initialViewControllerCount)
    }
    
    func testRemoveChildCoordinator_NonExistingCoordinator_DoesNotThrowError() {
        
        let mockChildCoordinator = MockCoordinator()
        
        XCTAssertNoThrow(sut.removeChildCoordinator(mockChildCoordinator))
    }
    
}

//MARK: - Extensions

extension QuizCoordinatorTests {
    
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
