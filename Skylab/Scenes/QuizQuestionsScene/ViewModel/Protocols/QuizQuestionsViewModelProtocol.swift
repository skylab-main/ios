//
//  QuizQuestionsViewModelProtocol.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 17/06/2023.
//

import Foundation

protocol QuizQuestionsViewModelProtocol {
    
    var quizData: QuizTopicsModel? { get set }
    
    func getQuestionText() -> String
    func nextQuestion()
    func getAnswers() -> [String]
    func checkCorrectAnswer(_ userAnswer: Int) -> Bool
    func getQuiz()
    func getNumberOfQuestions() -> Int
    func currentQuestionNumber() -> Int
}
