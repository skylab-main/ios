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
        
        applyForCourseButton.configureButton(title: "подати заявку на курс",
                                             imageName:  "rightArrow",
                                             fontName: "AnonymousPro-Bold",
                                             fontSize: 14,
                                             tintColor: .primary)
    }
}
