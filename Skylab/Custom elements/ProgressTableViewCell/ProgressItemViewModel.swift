//
//  ProgressItemViewModel.swift
//  Skylab
//
//  Created by Леонід Квіт on 22.06.2023.
//

import Foundation

class ProgressItemViewModel: ProgressItemViewModelProtocol {

    private let item: ProgressModel
    
    init(item: ProgressModel) {
        self.item = item
    }
    
    var title: String {
        return item.title
    }
    
    var progressValue: Float {
        return item.progressPercent/100
    }
    
    var progress: String {
        return String(format: "%.0f", item.progressPercent) + "%"
    }
}
