//
//  LevelsModel.swift
//  Skylab
//
//  Created by Леонід Квіт on 11.07.2023.
//

import Foundation

struct LevelModel: Codable {
    let title: String
    let videoID: String
    let linkPresentation: String
    let telegramLink: String
    let tasks: [String] // there may be several tasks on the same topic
}

typealias LevelsModel = [LevelModel]
