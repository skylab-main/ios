//
//  QuizResultViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 25/06/2023.
//

import Foundation
import RxSwift

class QuizResultViewModel: QuizResultViewModelProtocol {
    
    private var resultData: QuizResultModel?
    var repeatCurrentQuiz = PublishSubject<Void>()
    var openAllQuizzes = PublishSubject<Void>()
    var goToNextQuizz = PublishSubject<Void>()
    
    func setResultData(_ data: QuizResultModel?) {
        
        resultData = data
    }
    
    func getPercentageOfCorrectAnswers() -> Int {
        
        guard let resultData else { return 0 }
        
        return resultData.percentageOfCorrectAnswers
    }
    
    func getNumberOfCorrectAnswers() -> Int {
        
        guard let resultData else { return 0 }
        
        return resultData.numberOfCorrectAnswers
    }
    
    func getProgress() -> Float {
        
        guard let resultData else { return 0.0 }
        
        return resultData.progress
    }
    
    func getTopicTitle() -> String {
        
        guard let resultData else { return "" }
        
        return resultData.topicTitle
    }
    
    func getNumberOfQuestions() -> Int {
        
        guard let resultData else { return 0 }
        
        return resultData.numberOfQuestions
    }
    
    func repeatQuiz() {
        
        repeatCurrentQuiz.onNext(())
    }
    
    func goToAllQuizzes() {
        
        openAllQuizzes.onNext(())
    }
    
    func goToNextQuiz() {
        
    }
}
