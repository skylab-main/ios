//
//  LessonsViewModelProtocol.swift
//  Skylab
//
//  Created by Леонід Квіт on 01.06.2023.
//

import Foundation

protocol LessonsViewModelProtocol: AnyObject {
    
    var coordinatorDelegate: LessonsCoordinatorDelegate? { get set }

    func openLevelViewController(_ lesson: ProgressItemViewModelProtocol)
    
    func getLessons(completion: @escaping() -> ())
    func numberOfRowInSection(for section: Int) -> Int
    func cellViewModel(for indexPath: IndexPath) -> ProgressItemViewModelProtocol?
    func viewModelForSelectedRow() -> ProgressItemViewModelProtocol?
    func selectRow(atIndexPath indexPath: IndexPath)
}
