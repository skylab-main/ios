//
//  LessonsLevelViewModel.swift
//  Skylab
//
//  Created by Леонід Квіт on 13.07.2023.
//

import Foundation
import RxSwift

class LessonsLevelViewModel: LessonsLevelViewModelProtocol {

    var openLessonsVideoController = PublishSubject<LevelModel>()
    
    private var selectedIndexPath: IndexPath?
    private var levels: LevelsModel?
    
    //MARK: - Setup methods
    
    func setLevels(_ data: LevelsModel?) {
        levels = data
    }
    
    func numberOfRowInSection(for section: Int) -> Int {
        levels?.count ?? 0
    }
    
    func cellViewModel(for indexPath: IndexPath) -> LevelModel? {
        guard let levels else { return nil }
        let level = levels[indexPath.row]
        
        return level
    }
    

}

