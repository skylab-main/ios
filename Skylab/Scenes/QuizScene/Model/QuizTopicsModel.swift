//
//  QuizTopicsModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12/06/2023.
//

import Foundation

struct QuizTopicsModel {
    
    let quizzes: [Quiz]
    var chosenTopicTitle: String
    let progress: Float
    let numberOFCurrentTopic: Int
}

extension QuizTopicsModel: Equatable {
    
    static func == (lhs: QuizTopicsModel, rhs: QuizTopicsModel) -> Bool {
        
        guard
            lhs.quizzes == rhs.quizzes &&
                lhs.chosenTopicTitle == rhs.chosenTopicTitle &&
                lhs.progress == rhs.progress &&
                lhs.numberOFCurrentTopic == rhs.numberOFCurrentTopic
        else { return false }
        
        return true
        
    }
    
}
