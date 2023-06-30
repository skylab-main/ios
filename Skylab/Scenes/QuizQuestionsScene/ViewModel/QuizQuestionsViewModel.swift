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
    private var wrongOptionChosen: [Int: Bool] = [:]
    private var currentQuizTitle = ""
    private var questionNumber = 0
    private var correctAnswers = 0
    private var currentQuiz = 0
    private var numberOfTopics = 0
    
    //MARK: - Setup methods
    
    func setQuizData(_ data: QuizTopicsModel?) {
        
        quizData = data
        currentQuiz = quizData?.numberOFCurrentTopic ?? 0
        currentQuizTitle = quizData?.allData[currentQuiz].title ?? ""
        numberOfTopics = quizData?.allData.count ?? 0
    }
    
    func setToDefault() {
        
        quiz = [:]
        questionNumber = 0
        correctAnswers = 0
        wrongOptionChosen = [:]
    }
    
    //MARK: - Data retrieval methods
    
    func getQuestionText() -> String {
 
        let value = quiz[currentQuizTitle]
        
        return value?[questionNumber].question ?? ""
    }
    
    func getAnswers() -> [String] {
        
        let value = quiz[currentQuizTitle]
        
        return value?[questionNumber].options ?? []
    }
    
    func getQuiz() {

        quizData?.allData.forEach({ data in
            
            self.quiz[data.title] = data.questions
        })
    }
    
    func getNumberOfQuestions() -> Int {
        
        let value = quiz[currentQuizTitle]
        
        return value?.count ?? 0
    }
    
    func getQuizTopicTitle() -> String {
       
        currentQuizTitle
    }
    
    func getQuizProgress() -> Float {
        
        UserDefaults.standard.float(forKey: currentQuizTitle)
    }
    
    //MARK: - Quiz display processing methods
    
    func currentQuestionNumber() -> Int {
        
        return questionNumber + 1
    }
    
    func nextQuestion() {
        
        if questionNumber < (getNumberOfQuestions() - 1) {
            questionNumber += 1
        } else {
            let quizScoreInPercentage = Double(correctAnswers) / Double(getNumberOfQuestions()) * 100
            openQuizResultController.onNext((QuizResultModel(numberOfCorrectAnswers: correctAnswers,
                                                             percentageOfCorrectAnswers: Int(quizScoreInPercentage),
                                                             progress: Float(quizScoreInPercentage / 100),
                                                             topicTitle: getQuizTopicTitle(),
                                                             numberOfQuestions: getNumberOfQuestions())))
        }
    }
    
    func checkCorrectAnswer(_ userAnswer: Int) -> Bool {
        
        let value = quiz[currentQuizTitle]
        let currentQuestion = value?[questionNumber]
        
        countAnswers(userAnswer)
        
        if userAnswer == (currentQuestion?.answer ?? -1) {
            return true
        } else {
            return false
        }
    }
    
    private func countAnswers(_ answer: Int) {
        
        let value = quiz[currentQuizTitle]
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
    
    /// Method for displaying  the next quiz when the "next quiz" button on the 'QuizResult' screen is triggered.
    func goToNextQuiz() {
        
        guard let quizData else { return }
        
        let numberOfQuizzes = numberOfTopics
        
        if currentQuiz < numberOfQuizzes {
            
            currentQuizTitle = quizData.allData[currentQuiz].title
        } else {
            
            currentQuiz = 0
            currentQuizTitle = quizData.allData[currentQuiz].title
        }
        
        currentQuiz += 1
    }
    
}
