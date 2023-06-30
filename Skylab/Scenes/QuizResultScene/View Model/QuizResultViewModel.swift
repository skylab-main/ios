//
//  QuizResultViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 25/06/2023.
//

import Foundation
import RxSwift

class QuizResultViewModel: QuizResultViewModelProtocol {
    
    var repeatCurrentQuiz = PublishSubject<Void>()
    var openAllQuizzes = PublishSubject<Void>()
    var goToNextQuizz = PublishSubject<Void>()
    
    private var resultData: QuizResultModel?
    private let userDefaults = UserDefaults.standard
    
    func setResultData(_ data: QuizResultModel?) {
        
        guard let data else { return }
        
        resultData = data
        
        let previousResult = userDefaults.float(forKey: data.topicTitle)
        
        if data.progress > previousResult || previousResult == 0.0 {
            
            // Save data in UserDefaults
            userDefaults.set(data.progress, forKey: data.topicTitle)
        }
    }
    
    //MARK: - Data retrieval methods
    
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
    
    //MARK: - Transition methods
    
    func repeatQuiz() {
        
        repeatCurrentQuiz.onNext(())
    }
    
    func goToAllQuizzes() {
        
        openAllQuizzes.onNext(())
    }
}
