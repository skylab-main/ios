//
//  QuizQuestionsModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 18/06/2023.
//

import Foundation

struct QuizData: Codable {
    let quiz: [Quiz]
}

struct Quiz: Codable {
    let title: String
    let questions: [Question]
}

struct Question: Codable, Equatable {
    let question: String
    let options: [String]
    let answer: Int
}

extension Quiz: Equatable {
    
    static func == (lhs: Quiz, rhs: Quiz) -> Bool {
        
        guard
            lhs.title == rhs.title &&
                lhs.questions == rhs.questions else { return false }
        
        return true
    }
}

