//
//  CustomView.swift
//  Skylab
//
//  Created by Artem Tkachenko on 22.02.2023.
//

import UIKit

@IBDesignable class BaseBackgroundView: UIView {
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet { self.layer.borderWidth = borderWidth }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet { self.layer.cornerRadius = cornerRadius }
    }
    
    @IBInspectable var distance: CGFloat = 0
    
    @IBInspectable var borderColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0) {
        didSet { self.layer.borderColor = borderColor.cgColor }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addDoubleBorder()
    }
    
    func addDoubleBorder() {
        let bottomView = UIView(frame: CGRect(x: distance, y: distance, width: self.frame.width, height: self.frame.height))
        bottomView.layer.borderWidth = borderWidth
        bottomView.layer.borderColor = borderColor.cgColor
        bottomView.layer.cornerRadius = cornerRadius
        
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
