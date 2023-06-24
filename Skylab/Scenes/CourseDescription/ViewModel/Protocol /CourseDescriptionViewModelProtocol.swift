//
//  CourseDescriptionViewModelProtocol.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 25/05/2023.
//

import Foundation
import RxSwift

protocol CourseDescriptionViewModelProtocol: AnyObject {
    
    var openCourseDetailsController: PublishSubject<Void> { get set }
    var reviewsArray: [ReviewModel] { get set }
}
