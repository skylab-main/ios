//
//  MainMenuProtocol.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12/04/2023.
//

import Foundation

protocol MainMenuViewModelProtocol: AnyObject {
    
    var coordinator: MainMenuCoordinatorProtocol? { get set }
    
    func openViewController(tag: Int)
}
