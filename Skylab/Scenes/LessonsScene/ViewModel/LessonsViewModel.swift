//
//  LessonsViewModel.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import Foundation

class LessonsViewModel: LessonsViewModelProtocol {
    
    private var selectedIndexPath: IndexPath?
    private var lessons: ProgressArrayModel?

    func getLessons() {
        lessons = []
        lessons?.append(ProgressModel(title: "Lvl 1. Basics", progressPercent: 80))
        lessons?.append(ProgressModel(title: "Lvl 2. Introduction to code", progressPercent: 20))
        lessons?.append(ProgressModel(title: "Lvl 3. Something for not beginners", progressPercent: 45))
        lessons?.append(ProgressModel(title: "Lvl 4. Something if you think that you are strong middle developer", progressPercent: 20))
        lessons?.append(ProgressModel(title: "Lvl 5. Something for middle developers", progressPercent: 10))
    }
    
    func numberOfRowInSection(for section: Int) -> Int {
        lessons?.count ?? 0
    }
    
    func cellViewModel(for indexPath: IndexPath) -> ProgressItemViewModelProtocol? {
        guard let lessons else { return nil }
        let lesson = lessons[indexPath.row]
        
        return ProgressItemViewModel(item: lesson)
    }
    
    func viewModelForSelectedRow() -> ProgressItemViewModelProtocol? {
        guard let selectedIndexPath, let lessons else { return nil }
        let lesson = lessons[selectedIndexPath.row]
        
        return ProgressItemViewModel(item: lesson)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
}
