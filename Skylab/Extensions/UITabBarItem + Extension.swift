//
//  UITabBarItem + Extension.swift
//  Skylab
//
//  Created by Artem Tkachenko on 13.04.2023.
//

import UIKit

extension UITabBarItem {
    func setTitleText(fontName: String, size: CGFloat) {
        self.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size)], for: .normal)
    }
}
