//
//  QuizQuestionsViewModelProtocol.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 17/06/2023.
//

import Foundation
import RxSwift

protocol QuizQuestionsViewModelProtocol: AnyObject {
    
    var openQuizResultController: PublishSubject<QuizResultModel> { get set }
    
    func setQuizData(_ data: QuizTopicsModel?)
    func setToDefault()
    func getQuestionText() -> String
    func getAnswers() -> [String]
    func getQuiz()
    func getNumberOfQuestions() -> Int
    func getQuizTopicTitle() -> String
    func getQuizProgress() -> Float
    func nextQuestion()
    func currentQuestionNumber() -> Int
    func checkCorrectAnswer(_ userAnswer: Int) -> Bool
}
