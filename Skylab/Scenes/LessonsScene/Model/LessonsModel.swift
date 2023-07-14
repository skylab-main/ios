//
//  LessonsModel.swift
//  Skylab
//
//  Created by Леонід Квіт on 22.06.2023.
//

import Foundation

struct LessonModel: Codable {
    let title: String
    let progressPercent: Float
    let levels: LevelsModel
}

typealias LessonsModel = [LessonModel]
