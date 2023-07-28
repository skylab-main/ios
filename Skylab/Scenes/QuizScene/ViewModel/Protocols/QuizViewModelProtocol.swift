//
//  QuizViewModelProtocol.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12/06/2023.
//

import Foundation
import RxSwift

protocol QuizViewModelProtocol: AnyObject {
    
    var openQuizQuestionsController: PublishSubject<QuizTopicsModel> { get set }
    var networkManager: NetworkManagerProtocol? { get set }
    
    func setQuizTopics(with data: [QuizTopicsModel])
    func getQuizTopics()
    func getQuizTopicData() -> [QuizTopicsModel]
    func getNumberOfRowsInSection() -> Int
    func updateTopicData()
}
