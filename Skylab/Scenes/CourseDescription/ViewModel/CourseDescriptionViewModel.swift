//
//  CourseDescriptionViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 25/05/2023.
//

import Foundation

class CourseDescriptionViewModel: CourseDescriptionViewModelProtocol {
    
    var reviewsArray: [ReviewModel] = [ReviewModel(reviewer: "Karen Yue",
                                                   review: "“We were able to get a published, working version of the entire website live in less than two weeks. And we didn’t have to compromise on our original designs.”"),
                                       ReviewModel(reviewer: "Alex Kracov",
                                                   review: "“Velocity is crucial in marketing. The more campaigns we can put together, the more pages we can create, the bigger we feel.”")]
}
