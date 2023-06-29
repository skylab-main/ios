//
//  QuizQuestionsViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 17/06/2023.
//

import Foundation
import RxSwift

class QuizQuestionsViewModel: QuizQuestionsViewModelProtocol {
    
    var openQuizResultController = PublishSubject<QuizResultModel>()
    
    private var quizData: QuizTopicsModel?
    private var quiz: [String: [Question]] = [:]
    private var questionNumber = 0
    private var correctAnswers = 0
    private var wrongOptionChosen: [Int: Bool] = [:]
    
    func setQuizData(_ data: QuizTopicsModel?) {
        
        quizData = data
    }
    
    func setToDefault() {
        
        quiz = [:]
        questionNumber = 0
        correctAnswers = 0
        wrongOptionChosen = [:]
    }
    
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
                   openQuizResultController.onNext((QuizResultModel(numberOfCorrectAnswers: correctAnswers,
                                                                    percentageOfCorrectAnswers: Int(quizScoreInPercentage),
                                                                    progress: (quizData?.progress ?? 0.0),
                                                                    topicTitle: getQuizTopicTitle(),
                                                                   numberOfQuestions: getNumberOfQuestions())))
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
    
    func getQuizTopicTitle() -> String {
        
        quizData?.topic ?? ""
    }
    
    func getQuizProgress() -> Float {
        
        (quizData?.progress ?? 0.0) / 100
    }
    
}
