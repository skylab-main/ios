//
//  UITabBarItem + Extension.swift
//  Skylab
//
//  Created by Artem Tkachenko on 13.04.2023.
//

import UIKit

extension UITabBarItem {
    func setTitleText(font: UIFont) {
        self.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: font.fontName, size: font.pointSize) ?? UIFont.systemFont(ofSize: font.pointSize)], for: .normal)
    }
}
