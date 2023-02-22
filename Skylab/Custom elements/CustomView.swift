//
//  CustomView.swift
//  Skylab
//
//  Created by Artem Tkachenko on 22.02.2023.
//

import UIKit

@IBDesignable class CustomView: UIView {
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet { self.layer.borderWidth = borderWidth }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 1.0 {
        didSet { self.layer.cornerRadius = cornerRadius }
    }
    
    @IBInspectable var distance: CGFloat = 1.0
    
    @IBInspectable var borderColor: UIColor? {
        didSet { self.layer.borderColor = borderColor?.cgColor }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let borderColor = self.borderColor else { return }
        self.addDoubleBorder(borderWidth: borderWidth, borderColor: borderColor.cgColor, cornerRadius: cornerRadius, distance: distance)
    }
    
    func addDoubleBorder(borderWidth: CGFloat, borderColor: CGColor, cornerRadius: CGFloat, distance: CGFloat) {
        let bottomView = UIView(frame: CGRect(x: self.frame.minX + distance, y: self.frame.minY + distance, width: self.frame.width , height: self.frame.height))
        bottomView.layer.borderWidth = borderWidth
        bottomView.layer.borderColor = borderColor
        bottomView.layer.cornerRadius = cornerRadius
        bottomView.backgroundColor = .clear
        guard let superview = superview else { return }
        superview.insertSubview(bottomView, belowSubview: self)
    }
}
