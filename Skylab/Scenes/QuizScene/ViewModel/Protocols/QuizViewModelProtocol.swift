//
//  QuizViewModelProtocol.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12/06/2023.
//

import Foundation
import RxSwift

protocol QuizViewModelProtocol {
    
    var openQuizQuestionsController: PublishSubject<QuizTopicsModel> { get set }
    var quizTopicsArray: [QuizTopicsModel] { get set }
}
