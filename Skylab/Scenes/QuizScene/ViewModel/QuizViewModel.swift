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
    
    var quizTopicsArray: [QuizTopicsModel] = []
    
    func getQuizTopics() {
        
        NetworkManager.getQuiz { [self] quizData in
            
            quizData.forEach { quiz in
                quizTopicsArray.append(QuizTopicsModel(topic: quiz.title, progress: Float.random(in: 0...100)))
            }
        }
    }
}
