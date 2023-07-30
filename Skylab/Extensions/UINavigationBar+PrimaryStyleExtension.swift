//
//  UINavigationBar+PrimaryStyleExtension.swift
//  Skylab
//
//  Created by Сергей Молодец on 30.07.2023.
//

import UIKit

extension UINavigationBar {
    func primaryStyle() {
        self.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro-Bold", size: 20) ?? UIFont.systemFont(ofSize: 28),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        let backButtonImage = UIImage(named: "backArrow")
        self.backIndicatorImage = backButtonImage
        self.backIndicatorTransitionMaskImage = backButtonImage
        self.topItem?.backButtonDisplayMode = .minimal
    }
}
