//
//  UILabel + Extension.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 30/05/2023.
//

import UIKit

enum CustomFonts: String {
    
    case anonymousProBold = "AnonymousPro-Bold"
    case anonymousPro = "Anonymous Pro"
}

extension UILabel {
    
    func configureCustomLabel(font: CustomFonts, fontSize: CGFloat, textColor: UIColor, _ lineSpacing: CGFloat?) {
        
        let attributedString = NSMutableAttributedString(string: self.text ?? "")
        // Create a paragraph style
        let paragraphStyle = NSMutableParagraphStyle()
        // Set the line spacing (line height)
        paragraphStyle.lineSpacing = lineSpacing ?? 1.2
        // Apply the paragraph style to the attributed string
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))

        // Set the attributed and configure text on the label
        self.font = UIFont(name: font.rawValue, size: fontSize)
        self.textColor = textColor
        self.attributedText = attributedString
    }
}
