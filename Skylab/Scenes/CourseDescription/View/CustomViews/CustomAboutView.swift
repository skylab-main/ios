//
//  CustomAboutView.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 23/05/2023.
//

import UIKit

class CustomAboutView: BaseUIViewComponent {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var buttonDoubleBorderView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var applyForCourseButton: UIButton!
    
    func configureUI () {
        
        backgroundView.backgroundColor = .primary
        
        mainView.backgroundColor = .white
        mainView.layer.masksToBounds = true
        mainView.layer.cornerRadius = 15
        
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
        
        applyForCourseButton.titleLabel?.font = UIFont(name: "AnonymousPro-Bold", size: 14)
        applyForCourseButton.tintColor = .primary
        applyForCourseButton.setTitle("подати заявку на курс" + " \u{2192}", for: .normal)
    }
    
}
