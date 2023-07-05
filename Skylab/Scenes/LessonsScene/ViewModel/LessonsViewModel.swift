//
//  LessonsViewModel.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import Foundation

class LessonsViewModel: LessonsViewModelProtocol {
    
    private var lessons: LessonsModel?

    func getLessons() {
        lessons = []
        lessons?.append(LessonModel(title: "Lvl 1. Basics", progressPercent: 80))
        lessons?.append(LessonModel(title: "Lvl 2. Introduction to code", progressPercent: 20))
        lessons?.append(LessonModel(title: "Lvl 3. Something for not beginners", progressPercent: 45))
        lessons?.append(LessonModel(title: "Lvl 4. Something if you think that you are strong middle developer", progressPercent: 20))
        lessons?.append(LessonModel(title: "Lvl 5. Something for middle developers", progressPercent: 10))
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
