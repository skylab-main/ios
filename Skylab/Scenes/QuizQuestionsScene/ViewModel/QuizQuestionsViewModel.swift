//
//  QuizQuestionsViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 17/06/2023.
//

import Foundation

class QuizQuestionsViewModel: QuizQuestionsViewModelProtocol {
    
    var quizData: QuizTopicsModel?

    var quiz: [String: [Question]] = [:]
    
    var questionNumber = 0
    var quizScore = 0
    
    func getQuestionText() -> String {
 
        let value = quiz[quizData?.topic ?? ""]
        
        return value?[questionNumber].question ?? ""
    }
    
    func nextQuestion() {
        
        if questionNumber < (getNumberOfQuestions() - 1) {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    func getAnswers() -> [String] {
        
        let value = quiz[quizData?.topic ?? ""]
        
        return value?[questionNumber].options ?? []
    }
    
    func checkCorrectAnswer(_ userAnswer: Int) -> Bool {
        
        let value = quiz[quizData?.topic ?? ""]
        
        if userAnswer == (value?[questionNumber].answer ?? -1) {
            return true
        } else {
            return false
        }
    }
    
    func getQuiz() {
        
        NetworkManager.getQuiz { quizData in
            
            quizData.forEach { quiz in
                self.quiz[quiz.title] = quiz.questions
            }
        }
    }
    
    func getNumberOfQuestions() -> Int {
        
        let value = quiz[quizData?.topic ?? ""]
        
        return value?.count ?? 0
    }
    
}
