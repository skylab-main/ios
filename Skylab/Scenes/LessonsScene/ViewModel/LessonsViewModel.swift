//
//  LessonsViewModel.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import Foundation
import RxSwift

class LessonsViewModel: LessonsViewModelProtocol {
    
    var openLessonsLevelController = PublishSubject<LessonModel>()
    var openCourseDescriptionController = PublishSubject<Void>()
    
    private var lessons: LessonsModel?
    
    func getLessons() {
        NetworkManager.getLessons { [self] lessonsData in
            lessons = lessonsData
        }
    }
    
    func numberOfRowInSection(for section: Int) -> Int {
        lessons?.count ?? 0
    }
    
    func cellViewModel(for indexPath: IndexPath) -> LessonModel? {
        guard let lessons else { return nil }
        let lesson = lessons[indexPath.row]
        
        return lesson
    }
    
}
