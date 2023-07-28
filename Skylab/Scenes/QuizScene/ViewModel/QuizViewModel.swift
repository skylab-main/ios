//
//  QuizViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12.04.2023.
//

import Foundation
import RxSwift

class QuizViewModel: QuizViewModelProtocol {
    
    var openQuizQuestionsController = PublishSubject<QuizTopicsModel>()
    private var quizTopicsArray: [QuizTopicsModel] = []
    private let userDefaults = UserDefaults.standard
    var networkManager: NetworkManagerProtocol?
    
    func setQuizTopics(with data: [QuizTopicsModel]) {
        
        quizTopicsArray += data
    }
    
    func getQuizTopics() {
        
        networkManager?.getQuiz { [self] quizData in
            
            var counter = 0
            
            quizData.forEach { quiz in
                
                let userProgress = userDefaults.float(forKey: quiz.title)
                let data = QuizTopicsModel(quizzes: quizData,
                                           chosenTopicTitle: quiz.title,
                                           progress: userProgress,
                                           numberOFCurrentTopic: counter)
                
                setQuizTopics(with: [data])
                counter += 1
            }
        }
    }
    
    func getQuizTopicData() -> [QuizTopicsModel] {
        
        return quizTopicsArray
    }
    
    func getNumberOfRowsInSection() -> Int {
        
        return quizTopicsArray.count
    }
    
    func updateTopicData() {
        
        quizTopicsArray = []
        getQuizTopics()
    }
}
