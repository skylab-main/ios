//
//  AboutViewModel.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import Foundation

class AboutViewModel {
    
    weak var coordinatorDelegate: AboutCoordinatorDelegate?
    
    func openCourseDescriptionViewController() {
        
        coordinatorDelegate?.openCourseDescriptionViewControllerDelegate()
    }
}
