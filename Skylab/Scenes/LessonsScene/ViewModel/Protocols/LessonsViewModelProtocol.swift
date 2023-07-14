//
//  LessonsViewModelProtocol.swift
//  Skylab
//
//  Created by Леонід Квіт on 01.06.2023.
//

import Foundation
import RxSwift

protocol LessonsViewModelProtocol: AnyObject {
    
    var openLessonsLevelController: PublishSubject<LessonModel> { get set }
    
    func getLessons()
    func numberOfRowInSection(for section: Int) -> Int
    func cellViewModel(for indexPath: IndexPath) -> LessonModel?
    
}
