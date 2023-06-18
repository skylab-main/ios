//
//  QuizNetworkModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 18/06/2023.
//

import Foundation

// MARK: - Welcome
struct QuizData: Codable {
    let quiz: [Quiz]
}

// MARK: - Quiz
struct Quiz: Codable {
    let title: String
    let questions: [Question]
}

// MARK: - Question
struct Question: Codable {
    let question: String
    let options: [String]
    let answer: Int
}
