//
//  CustomView.swift
//  Skylab
//
//  Created by Artem Tkachenko on 22.02.2023.
//

import UIKit

@IBDesignable class BaseBackgroundView: UIView {
    
//    Sets the width of the border of the view.
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet { self.layer.borderWidth = borderWidth }
    }
//    Sets the corner radius of the view.
    @IBInspectable var cornerRadius: CGFloat = 12 {
        didSet { self.layer.cornerRadius = cornerRadius }
    }
//    Sets the distance between the two borders of the view.
    @IBInspectable var distance: CGFloat = 6
    
//    Sets the color of the border of the view.
    @IBInspectable var borderColor: UIColor = UIColor(red: 16/255, green: 68/255, blue: 153/255, alpha: 1) {
        didSet { self.layer.borderColor = borderColor.cgColor }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderColor = self.borderColor.cgColor
        self.layer.borderWidth = self.borderWidth
        self.layer.cornerRadius = self.cornerRadius
        self.addDoubleBorder()
    }
    
    func addDoubleBorder() {
//     Сreates a new UIView instance called bottomView.
        let bottomView = UIView(frame: CGRect(x: distance, y: distance, width: self.frame.width, height: self.frame.height))
        bottomView.layer.borderWidth = borderWidth
        bottomView.layer.borderColor = borderColor.cgColor
        bottomView.layer.cornerRadius = cornerRadius
//    Removes needless lines of bottomView using a mask.
        let maskLayer = CAShapeLayer()
        let path = UIBezierPath(rect: bottomView.bounds)
        let maskPath = UIBezierPath(roundedRect: CGRect(x: -distance, y: -distance, width: self.frame.width, height: self.frame.height), cornerRadius: cornerRadius)
        path.append(maskPath)
        maskLayer.path = path.cgPath
        maskLayer.fillRule = .evenOdd
        bottomView.layer.mask = maskLayer
        self.addSubview(bottomView)
    }
}
