//
//  ResultCheckViewModel.swift
//  Skylab
//
//  Created by Сергей Молодец on 31.07.2023.
//

import Foundation
import RxSwift

class ResultCheckViewModel: ResultCheckViewModelProtocol {
    var openResultCheckController = PublishSubject<String>()
    var openApiManualDoc = PublishSubject<Void>()
}
