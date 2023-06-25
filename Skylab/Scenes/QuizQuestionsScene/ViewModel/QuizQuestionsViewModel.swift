//
//  QuizQuestionsViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 17/06/2023.
//

import Foundation
import RxSwift

class QuizQuestionsViewModel: QuizQuestionsViewModelProtocol {
    
    var quizData: QuizTopicsModel? = nil
    var openQuizResultController = PublishSubject<Void>()

    private var quiz: [String: [Question]] = [:]
    private var questionNumber = 0
    private var quizScore = 0
    
    func getQuestionText() -> String {
 
        let value = quiz[quizData?.topic ?? ""]
        
        return value?[questionNumber].question ?? ""
    }
    
    func nextQuestion() {
        
        //questionNumber = (questionNumber + 1) % getNumberOfQuestions()
        
        if questionNumber < (getNumberOfQuestions() - 1) {
                   questionNumber += 1
               } else {
                   openQuizResultController.onNext(())
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
    
    func currentQuestionNumber() -> Int {
        
        return questionNumber + 1
    }
    
}
