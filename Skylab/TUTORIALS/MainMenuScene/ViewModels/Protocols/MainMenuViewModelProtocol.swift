//
//  MainMenuProtocol.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12/04/2023.
//

import Foundation

protocol MainMenuViewModelProtocol: AnyObject {
    
    var coordinatorDelegate: MainMenuCoordinatorDelegate? { get set }
    
    func openViewController(tag: Int)
}
