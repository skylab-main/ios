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
    
    private var selectedIndexPath: IndexPath?
    private var lessons: LessonsModel?
    
    func getLessons() {
        
        //        lessons = [LessonModel(title: "Lvl 1. Basics", progressPercent: 80),
        //                   LessonModel(title: "Lvl 2. Introduction to code", progressPercent: 20),
        //                   LessonModel(title: "Lvl 3. Something for not beginners", progressPercent: 45),
        //                   LessonModel(title: "Lvl 4. Something if you think that you are strong middle developer", progressPercent: 20),
        //                   LessonModel(title: "Lvl 5. Something for middle developers", progressPercent: 10),
        //                   LessonModel(title: "Lvl 6. Something for senior developers", progressPercent: 25),
        //                   LessonModel(title: "Lvl 7. Something for lead developers", progressPercent: 25)]
        
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
    
//    func viewModelForSelectedRow() -> LessonsLevelViewModelProtocol? {
//        guard let selectedIndexPath, let lessons else { return nil }
//        let lesson = lessons[selectedIndexPath.row]
//        
//        return lesson.
//    }
//    
//    func selectRow(atIndexPath indexPath: IndexPath) {
//        self.selectedIndexPath = indexPath
//    }
}
