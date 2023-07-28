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
    private var levelTitle: String?
    
    //MARK: - Setup methods
    
    func setLevels(_ data: LevelsModel?) {
        levels = data
    }
    
    func setLevelTitle(_ title: String?) {
        levelTitle = title
    }
    
    func titleText() -> String? {
        return levelTitle
    }
    
    func numberOfRowInSection(for section: Int) -> Int {
        levels?.count ?? 0
    }
    
    func cellViewModel(for indexPath: IndexPath) -> LevelModel? {
        guard let levels else { return nil }
        let level = levels[indexPath.row]
        
        return level
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
            self.selectedIndexPath = indexPath
        }

}

