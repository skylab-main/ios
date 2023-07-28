//
//  LessonsLevelViewModelProtocol.swift
//  Skylab
//
//  Created by Леонід Квіт on 13.07.2023.
//

import Foundation
import RxSwift

protocol LessonsLevelViewModelProtocol: AnyObject {
    
    var openLessonsVideoController: PublishSubject<LevelModel> { get set }
    
    func setLevels(_ data: LevelsModel?)
    func setLevelTitle(_ title: String?)
    func titleText() -> String?
    func numberOfRowInSection(for section: Int) -> Int
    func cellViewModel(for indexPath: IndexPath) -> LevelModel?
    func selectRow(atIndexPath indexPath: IndexPath)
}

