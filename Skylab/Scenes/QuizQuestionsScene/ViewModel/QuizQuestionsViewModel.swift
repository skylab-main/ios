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
    private var correctAnswers = 0
    private var wrongOptionChosen: [Int: Bool] = [:]
    
    func getQuestionText() -> String {
 
        let value = quiz[quizData?.topic ?? ""]
        
        return value?[questionNumber].question ?? ""
    }
    
    func nextQuestion() {
        
        //openQuizResultController.onNext(())
        
        if questionNumber < (getNumberOfQuestions() - 1) {
                   questionNumber += 1
               } else {
                   let quizScoreInPercentage = Double(correctAnswers) / Double(getNumberOfQuestions()) * 100
                   openQuizResultController.onNext(())
               }
    }
    
    func getAnswers() -> [String] {
        
        let value = quiz[quizData?.topic ?? ""]
        
        return value?[questionNumber].options ?? []
    }
    
    func checkCorrectAnswer(_ userAnswer: Int) -> Bool {
        
        let value = quiz[quizData?.topic ?? ""]
        let currentQuestion = value?[questionNumber]
        
        countAnswers(userAnswer)
        
        if userAnswer == (currentQuestion?.answer ?? -1) {
            return true
        } else {
            return false
        }
    }
    
    private func countAnswers(_ answer: Int) {
        
        let value = quiz[quizData?.topic ?? ""]
        let currentQuestion = value?[questionNumber]
        
        if let hasChosenWrongOption = wrongOptionChosen[questionNumber], hasChosenWrongOption {
            // User has already chosen a wrong option for this question
            return
        }
        
        if answer == currentQuestion?.answer {
            correctAnswers += 1
        } else {
            wrongOptionChosen[questionNumber] = true
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
