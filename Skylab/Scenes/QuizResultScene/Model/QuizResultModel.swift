//
//  QuizResultModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 28/06/2023.
//

import Foundation

struct QuizResultModel {
    
    let numberOfCorrectAnswers: Int
    let percentageOfCorrectAnswers: Int
    let progress: Float
    let topicTitle: String
    let numberOfQuestions: Int
}
