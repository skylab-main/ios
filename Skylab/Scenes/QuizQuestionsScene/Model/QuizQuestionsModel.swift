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

struct Question: Codable {
    let question: String
    let options: [String]
    let answer: Int
}
