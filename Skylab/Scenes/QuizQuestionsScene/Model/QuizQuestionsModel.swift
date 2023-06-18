//
//  QuizQuestionsModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 18/06/2023.
//

import Foundation

struct QuizQuestionsTopicModel {
    
    let questionTopic: String
    let questions: [QuizQuestionsModel]
}

struct QuizQuestionsModel {
    
    let question: String
    let answer: [String]
    let correctAnswer: String
}
