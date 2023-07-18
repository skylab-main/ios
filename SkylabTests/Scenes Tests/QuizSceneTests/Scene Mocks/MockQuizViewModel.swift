//
//  MockQuizViewModel.swift
//  SkylabTests
//
//  Created by Aleksey Kotsevych on 17/07/2023.
//

import Foundation
import RxSwift
@testable import Skylab

class MockQuizViewModel: QuizViewModelProtocol {
    
    var openQuizQuestionsController = PublishSubject<QuizTopicsModel>()
    var networkManager: NetworkManagerProtocol?
    var getQuizTopicsCalled = false
    var openQuizQuestionsControllerCalled = false
    
    private var mockData: [QuizTopicsModel] = []
    private let disposeBag = DisposeBag()
    
    func triggerOpenQuizQuestionsController() {
        
        openQuizQuestionsController
            .subscribe(onNext: { _ in
                self.openQuizQuestionsControllerCalled = true
            })
            .disposed(by: disposeBag)
    }
    
    func setQuizTopics(with data: [QuizTopicsModel]) {
        
        mockData = data
    }
    
    func getQuizTopicData() -> [QuizTopicsModel] {
        
        return mockData
    }
    
    func getNumberOfRowsInSection() -> Int {
        
        return mockData.count
    }

    func getQuizTopics() {
        
        getQuizTopicsCalled = true
    }
    
    func updateTopicData() {
        
        getQuizTopics()
    }
}
