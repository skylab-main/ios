//
//  LessonsViewModel.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import Foundation

class LessonsViewModel {
    
    var coordinatorDelegate: LessonsCoordinatorDelegate?
    var lessonsArray: [(String, Int)] = [("Lvl 1. Basics", 80),
                                           ("Lvl 2. Introduction to code", 20),
                                           ("Lvl 3. Something for not beginners", 45),
                                           ("Lvl 4. Something if you think that you are strong middle developer", 20),
                                           ("Lvl 5. Something for middle developers", 10)]
    
    func openLevelViewController(_ lesson: String) {
        
        coordinatorDelegate?.openLevelViewControllerDelegate()
        
    }
    
}
