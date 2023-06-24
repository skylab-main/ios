//
//  UIButton + Extensions.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 11/06/2023.
//

import UIKit

extension UIButton {
    
    func configureButton(title: String, imageName: String?, fontName: String?, fontSize: CGFloat?, tintColor: UIColor?) {
        
        /// Create attributed string with title and image. Create font attributes
        let title = title
        
        let image = UIImage(named: imageName ?? "")
        let titleFont = UIFont(name: fontName ?? "System", size: fontSize ?? 16)

        // Create attributed string with title
        let titleAttributes: [NSAttributedString.Key: Any] = [.font: titleFont ?? .boldSystemFont(ofSize: 14)]
        let attributedString = NSMutableAttributedString(string: title, attributes: titleAttributes)

        // Add spacing between title and image
        let spaceString = NSAttributedString(string: " ") // Use any desired spacing string
        attributedString.append(spaceString)
        
        if imageName != nil {
            // Create image attachment
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = image
            
            // Create attributed string with image
            let imageString = NSAttributedString(attachment: imageAttachment)
            
            // Append the image to the attributed string
            attributedString.append(imageString)
        }

        // Set attributed title to the button
        self.tintColor = tintColor ?? .clear
        self.setAttributedTitle(attributedString, for: .normal)
    }
}

