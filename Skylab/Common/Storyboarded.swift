//
//  Storyboarded.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 18.12.2022.
//

import UIKit

protocol Storyboarded: AnyObject {

    static func instantiate(coordinator: Coordinator, bundle: Bundle?) -> Self

    var coordinator: Coordinator? { get set }
}

extension Storyboarded where Self: UIViewController {

    static func instantiate(coordinator: Coordinator, bundle: Bundle? = nil) -> Self {
        let board = UIStoryboard(name: String(describing: self), bundle: bundle)
        let vc = board.instantiateInitialViewController()
        let controller = vc as! Self
        controller.coordinator = coordinator
        return controller
    }
}

