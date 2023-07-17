//
//  MockNavigationController.swift
//  SkylabTests
//
//  Created by Aleksey Kotsevych on 17/07/2023.
//

import UIKit

class MockNavigationController: UINavigationController {
    
    var pushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        pushedViewController = viewController
        super.pushViewController(viewController, animated: animated)
    }
}
