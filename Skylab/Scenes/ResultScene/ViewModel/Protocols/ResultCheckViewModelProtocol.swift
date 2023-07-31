//
//  ResultCheckViewModelProtocol.swift
//  Skylab
//
//  Created by Сергей Молодец on 31.07.2023.
//

import Foundation
import RxSwift

protocol ResultCheckViewModelProtocol {
    var openResultCheckController: PublishSubject<Void> { get }
    var openApiManualDoc: PublishSubject<Void> { get }
}
