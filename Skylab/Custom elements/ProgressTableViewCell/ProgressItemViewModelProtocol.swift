//
//  ProgressItemViewModelProtocol.swift
//  Skylab
//
//  Created by Леонід Квіт on 22.06.2023.
//

import Foundation

protocol ProgressItemViewModelProtocol {
    var title: String { get }
    var progress: String { get }
    var progressValue: Float { get }
}
