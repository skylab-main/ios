//
//  QuizViewControllerTests.swift
//  SkylabTests
//
//  Created by Aleksey Kotsevych on 17/07/2023.
//

import XCTest
import RxSwift
@testable import Skylab

final class QuizViewControllerTests: XCTestCase {
    
    var sut: QuizViewController!
    var viewModel: QuizViewModelProtocol!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: String(describing: QuizViewController.self), bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: QuizViewController.self)) as? QuizViewController
        sut = vc
        
        viewModel = MockQuizViewModel()
        sut.viewModel = viewModel
        
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        
        viewModel = nil
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testController_HasBackgroundView() {
    
        XCTAssertNotNil(sut.backgroundView)
        XCTAssertTrue(sut.backgroundView.isDescendant(of: sut.view))
    }
    
    func testController_HasHelpfulResourcesButton() {
        
        XCTAssertNotNil(sut.helpfulResourcesButton)
        XCTAssertTrue(sut.helpfulResourcesButton.isDescendant(of: sut.view))
    }
    
    func testController_HasQuizTopicsTableView() {
        
        XCTAssertNotNil(sut.quizTopicsTableView)
        XCTAssertTrue(sut.quizTopicsTableView.isDescendant(of: sut.view))
    }
    
    func testWhenViewIsLoaded_TableViewDelegateIsSet() {
        
        XCTAssertTrue(sut.quizTopicsTableView.delegate is QuizViewController)
    }
    
    func testWhenViewIsLoaded_TableViewDataSourceIsSet() {
        
        XCTAssertTrue(sut.quizTopicsTableView.dataSource is QuizViewController)
    }
    
    func testWhenViewAppeared_TableViewReloaded() {
        
        // Given
        let mockTableView = MockTableView()
        sut.quizTopicsTableView = mockTableView

        // Create an expectation for the reloadData() method
        let expectation = XCTestExpectation(description: "Reload data expectation")

        // When
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()

        // Then
        DispatchQueue.main.async {
            XCTAssertTrue(mockTableView.isReloaded)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testTableViewNumberOfRowsInSection_WhenInit_ReturnViewModelsCount() {
        
        // Given
        let expected = setUpMockData().count
        
        // When
        viewModel.setQuizTopics(with: setUpMockData())
        let actual = sut.tableView(sut.quizTopicsTableView, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(actual, expected)
    }
    
    func testTappingCell_SendsNotification() {
        
        // Given
        var isNotificationSent = false
        let expectedData = setUpMockData().first
        viewModel.setQuizTopics(with: setUpMockData())
        
        let observer = NotificationCenter.default.addObserver(forName: Notification.Name("Topic selected"), object: nil, queue: nil) { notification in
            
            guard
                let actualData = notification.userInfo?["topicData"] as? QuizTopicsModel
            else { return }
            
            XCTAssertEqual(expectedData, actualData)
            isNotificationSent = true
        }
        
        // When
        sut.tableView(sut.quizTopicsTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
    
        // Then
        XCTAssertTrue(isNotificationSent)
        
        NotificationCenter.default.removeObserver(observer)
    }
    
    func testOpenQuizQuestionsController_NotificationPushesQuizQuestionsVC() {
        
        // Given
        let bag = DisposeBag()
        let mockNavigationController = MockNavigationController(rootViewController: sut)
        let expectedQuizData = setUpMockData().first
        
        viewModel.setQuizTopics(with: setUpMockData())
        let actualData = viewModel.getQuizTopicData().first
        
        // Subscribe to the openQuizQuestionsController subject
        let expectation = expectation(description: "Quiz questions controller opened")
        
        sut.viewModel?.openQuizQuestionsController.subscribe(onNext: { [weak self] quizData in
            
            guard let self else { return }
            
            let vc = self.quizQuestionsVC()
            vc.title = quizData.chosenTopicTitle
            mockNavigationController.pushViewController(vc, animated: true)
            
            // Assert that the onNext closure is called with the expected quiz data
            XCTAssertEqual(quizData, expectedQuizData)
            
            // The check is set to the same title as expected
            XCTAssertEqual(vc.title, expectedQuizData?.chosenTopicTitle)
            expectation.fulfill()
            
        }).disposed(by: bag)
        
        // When
        guard let actualData else { return }
        viewModel.openQuizQuestionsController.onNext(actualData)
        
        // Then
        // Wait for the expectation to be fulfilled, indicating that the openQuizQuestionsController was called
        waitForExpectations(timeout: 2.0, handler: nil)

        XCTAssertNotNil(mockNavigationController.pushedViewController)
        XCTAssertTrue(mockNavigationController.pushedViewController is QuizQuestionsViewController)
    }
    
    func testViewDidAppear_CallsGetQuizTopicsInViewModel() {
        
        // Given
        let viewModelMock = viewModel as! MockQuizViewModel
        
        // When
        sut.viewDidAppear(false)
        
        // Then
        XCTAssertTrue(viewModelMock.getQuizTopicsCalled)
    }

    func testViewModelUpdateTopicData_CallsGetQuizTopicsAgain() {
        
        // Given
        let viewModelMock = viewModel as! MockQuizViewModel
        viewModelMock.getQuizTopicsCalled = false
        
        // When
        sut.viewModel?.updateTopicData()
        
        // Then
        XCTAssertTrue(viewModelMock.getQuizTopicsCalled)
    }
    
}

//MARK: - Extensions

extension QuizViewControllerTests {
    
    func setUpMockData() -> [QuizTopicsModel] {
        
        let question = Question(question: "Foo", options: ["Baz"], answer: 0)
        let quiz = Quiz(title: "Bar", questions: [question])
        let mockData: [QuizTopicsModel]  = [QuizTopicsModel(quizzes: [quiz],
                                                            chosenTopicTitle: "Baz",
                                                            progress: 0.5,
                                                            numberOFCurrentTopic: 1)]
        
        return mockData
    }
    
    func quizQuestionsVC() -> UIViewController {
        
        let storyboard = UIStoryboard(name: String(describing: QuizQuestionsViewController.self), bundle: nil)
        guard
            let vc = storyboard.instantiateViewController(withIdentifier: String(describing: QuizQuestionsViewController.self)) as? QuizQuestionsViewController else { return UIViewController() }
        
        return vc
    }
}

