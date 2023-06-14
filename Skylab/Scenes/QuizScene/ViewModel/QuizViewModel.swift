//
//  QuizViewModel.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import Foundation

class QuizViewModel: QuizViewModelProtocol {
    
    var quizTopicsArray: [QuizTopicsModel] = [ QuizTopicsModel(topic: "User Interface (UIKit)", progress: 80),
                                               QuizTopicsModel(topic: "Data layer in  iOS Applications", progress: 45),
                                               QuizTopicsModel(topic: "Learning Swift", progress: 31),
                                               QuizTopicsModel(topic: "Multithreading", progress: 20),
                                               QuizTopicsModel(topic: "Multithreading", progress: 63),
                                               QuizTopicsModel(topic: "User Interface (UIKit)", progress: 80),
                                               QuizTopicsModel(topic: "Data layer in  iOS Applications", progress: 45),
                                               QuizTopicsModel(topic: "Learning Swift", progress: 31),
                                               QuizTopicsModel(topic: "Multithreading", progress: 20),
                                               QuizTopicsModel(topic: "Multithreading", progress: 63),
    ]
}
