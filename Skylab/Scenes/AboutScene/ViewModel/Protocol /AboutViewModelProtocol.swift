//
//  AboutViewModelProtocol.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 31/05/2023.
//

import Foundation
import RxSwift

protocol AboutViewModelProtocol: AnyObject {
    
    var openCourseDescriptionController: PublishSubject<Void> { get set }
}
