//
//  QuizViewModel.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import Foundation
import RxSwift

class QuizViewModel: QuizViewModelProtocol {
    
    var openQuizQuestionsController = PublishSubject<QuizTopicsModel>()
    private var quizTopicsArray: [QuizTopicsModel] = []
    private let userDefaults = UserDefaults.standard
    
    func getQuizTopics() {
        
        NetworkManager.getQuiz { [self] quizData in
            
            var counter = 0
            
            quizData.forEach { quiz in
                
                let userProgress = userDefaults.float(forKey: quiz.title)
                
                quizTopicsArray.append(QuizTopicsModel(allData: quizData,
                                                       chosenTopicTitle: quiz.title,
                                                       progress: userProgress,
                                                       numberOFCurrentTopic: counter))
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
