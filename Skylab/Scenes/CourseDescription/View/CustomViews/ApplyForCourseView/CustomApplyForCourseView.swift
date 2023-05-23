//
//  CustomApplyForCourseView.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 23/05/2023.
//

import UIKit

class CustomApplyForCourseView: BaseUIViewComponent {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var buttonDoubleBorderView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var applyForCourseButton: UIButton!
    
    func configureUI () {
        
        backgroundView.backgroundColor = .primary

        bottomView.layoutIfNeeded()
        bottomView.layer.addBorder(side: .top, thickness: 1, color: UIColor.systemGray5.cgColor)
        bottomView.layer.borderColor = UIColor.gray.cgColor
        
        buttonDoubleBorderView.backgroundColor = .primary
        buttonDoubleBorderView.layer.masksToBounds = true
        buttonDoubleBorderView.layer.cornerRadius = 12
        
        buttonView.backgroundColor = .white
        buttonView.layer.borderWidth = 1
        buttonView.layer.borderColor = UIColor.primary.cgColor
        buttonView.layer.masksToBounds = true
        buttonView.layer.cornerRadius = 12
        
        configureButtonTitle()
    }
    
    private func configureButtonTitle() {
        
        /// Create attributed string with title and image. Create font attributes
        let title = "подати заявку на курс"
        let image = UIImage(named: "rightArrow")
        let titleFont = UIFont(name: "AnonymousPro-Bold", size: 14)

        // Create attributed string with title
        let titleAttributes: [NSAttributedString.Key: Any] = [.font: titleFont ?? .boldSystemFont(ofSize: 14)]
        let attributedString = NSMutableAttributedString(string: title, attributes: titleAttributes)

        // Add spacing between title and image
        let spaceString = NSAttributedString(string: "  ") // Use any desired spacing string
        attributedString.append(spaceString)
        
        // Create image attachment
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        
        // Create attributed string with image
        let imageString = NSAttributedString(attachment: imageAttachment)

        // Append the image to the attributed string
        attributedString.append(imageString)

        // Set attributed title to the button
        applyForCourseButton.tintColor = .primary
        applyForCourseButton.setAttributedTitle(attributedString, for: .normal)
    }
}
