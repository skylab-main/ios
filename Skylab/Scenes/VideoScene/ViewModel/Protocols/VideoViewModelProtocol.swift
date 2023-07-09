//
//  VideoViewModelProtocol.swift
//  Skylab
//
//  Created by Сергей Молодец on 09.07.2023.
//

import Foundation
protocol VideoViewModelProtocol: AnyObject {
    var title: String { get }
    var videoID: String { get }
    var linkPresentation: String { get }
    var task: String { get }
    var isTaskDone: Bool { get set }
}
