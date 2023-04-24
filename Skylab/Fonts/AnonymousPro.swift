//
//  AnonymusPro.swift
//  Skylab
//
//  Created by Artem Tkachenko on 25.04.2023.
//

import UIKit

enum AnonymousPro {
    case regular(size: CGFloat)
    case bold(size: CGFloat)
    
    var name: String {
        switch self {
        case .regular:
            return "AnonymousPro-Regular"
        case .bold:
            return "AnonymousPro-Bold"
        }
    }

    var size: CGFloat {
        switch self {
        case .regular(let size):
            return size
        case .bold(let size):
            return size
        }
    }
    
    func font() -> UIFont {
        guard let font = UIFont(name: self.name, size: self.size) else {
            return UIFont.systemFont(ofSize: self.size)
        }
        return font
    }
}
