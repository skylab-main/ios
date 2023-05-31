//
//  AboutViewModel.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import Foundation
import RxSwift

class AboutViewModel: AboutViewModelProtocol {
    
    var openCourseDescriptionController = PublishSubject<Void>()

}
