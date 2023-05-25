//
//  ServiceManager.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 25/05/2023.
//

import UIKit

class ServiceManager {
    
    static let shared = ServiceManager()
    private init() {}
    
    enum CustomFonts: String {
        
        case anonymousProBold = "AnonymousPro-Bold"
        case anonymousPro = "Anonymous Pro"
    }
    
    func configureCustom(_ label: UILabel, font: CustomFonts, fontSize: CGFloat, textColor: UIColor, _ lineSpacing: CGFloat?) -> UILabel {
        
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        // Create a paragraph style
        let paragraphStyle = NSMutableParagraphStyle()
        // Set the line spacing (line height)
        paragraphStyle.lineSpacing = lineSpacing ?? 1.2
        // Apply the paragraph style to the attributed string
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))

        // Set the attributed and configure text on the label
        label.font = UIFont(name: font.rawValue, size: fontSize)
        label.textColor = textColor
        label.attributedText = attributedString
        
        return label
    }
}
