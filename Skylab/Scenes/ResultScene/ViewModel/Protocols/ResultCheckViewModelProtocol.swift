//
//  ResultCheckViewModelProtocol.swift
//  Skylab
//
//  Created by Сергей Молодец on 31.07.2023.
//

import Foundation
import RxSwift

protocol ResultCheckViewModelProtocol {
    var openResultCheckController: PublishSubject<String> { get }
    var openApiManualDoc: PublishSubject<Void> { get }
    var goToVideoScene: PublishSubject<Void> { get }
}
