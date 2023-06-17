//
//  UINavigatorController + Extension.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 17/06/2023.
//

import UIKit

extension UINavigationController {
    
    // Changes transition animations for NavigationController
    
    func setViewControllerWithAnimation(viewController: UIViewController) {
        
        self.setViewControllers([viewController], animated: false)
        if let transitionView = self.view{
            UIView.transition(with:transitionView, duration: 0.8, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
    func pushViewControllerWithFlipAnimation(viewController: UIViewController) {
        
          self.pushViewController(viewController, animated: false)
          if let transitionView = self.view{
              UIView.transition(with:transitionView, duration: 0.8, options: .transitionCrossDissolve, animations: nil, completion: nil)
          }
      }

      func popViewControllerWithFlipAnimation() {
          
          self.popViewController(animated: false)
          if let transitionView = self.view{
              UIView.transition(with:transitionView, duration: 0.8, options: .transitionCrossDissolve, animations: nil, completion: nil)
          }
      }
}
