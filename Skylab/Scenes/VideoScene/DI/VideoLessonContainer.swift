//
//  VideoLessonContainer.swift
//  Skylab
//
//  Created by Сергей Молодец on 09.07.2023.
//

import Foundation
import Swinject

extension Container {
    
    static let videoLessonTask = {
        
        let container = Container()
        
        container.register(VideoViewModelProtocol.self) { _ in
            VideoViewModel()
        }
        return container
    }()
}
