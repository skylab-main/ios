//
//  QuizResultViewModelProtocol.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 28/06/2023.
//

import Foundation
import RxSwift

protocol QuizResultViewModelProtocol {
    
    var repeatCurrentQuiz: PublishSubject<Void> { get set }
    var openAllQuizzes: PublishSubject<Void> { get set }
    var goToNextQuizz: PublishSubject<Void> { get set }
    
    func setResultData(_ data: QuizResultModel?)
    func getPercentageOfCorrectAnswers() -> Int
    func getNumberOfCorrectAnswers() -> Int
    func getProgress() -> Float
    func getTopicTitle() -> String
    func getNumberOfQuestions() -> Int
}
