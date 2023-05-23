//
//  DoubleBorderView.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 23/05/2023.
//

import UIKit

@IBDesignable
final class DoubleBorderView: UIView {
    // MARK: Inspectable Properties
    
    // These are inspectable properties that can be set in Interface Builder
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet { self.layer.borderWidth = borderWidth }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 12 {
        didSet { self.layer.cornerRadius = cornerRadius }
    }
    
    @IBInspectable var distance: CGFloat = 3
    
    @IBInspectable var borderColor: UIColor = UIColor(red: 16/255, green: 68/255, blue: 153/255, alpha: 1) {
        didSet { self.layer.borderColor = borderColor.cgColor }
    }
    // MARK: View Lifecycle
    
    // This method is called whenever the view's layout changes
    override func layoutSubviews() {
        super.layoutSubviews()
        setDefaultLayer()
        addDoubleBorder()
    }
    // MARK: Private Methods
    
    // This private method sets the default layer properties
    private func setDefaultLayer() {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    // This private method adds the double border to the view
    private func addDoubleBorder() {
        // Create a new subview to hold the bottom border
        let bottomView = UIView(frame: CGRect(x: distance, y: distance, width: self.frame.width, height: self.frame.height))
        bottomView.backgroundColor = .primary
        bottomView.layer.borderWidth = borderWidth
        bottomView.layer.borderColor = borderColor.cgColor
        bottomView.layer.cornerRadius = cornerRadius
        // Create a mask layer to subtract the rounded corners from the bottom view
        let maskLayer = CAShapeLayer()
        let path = UIBezierPath(rect: bottomView.bounds)
        let maskPath = UIBezierPath(roundedRect: CGRect(x: -distance, y: -distance, width: self.frame.width, height: self.frame.height), cornerRadius: cornerRadius)
        path.append(maskPath)
        maskLayer.path = path.cgPath
        maskLayer.fillRule = .evenOdd
        bottomView.layer.mask = maskLayer
        // Add the bottom view as a subview of the main view
        self.addSubview(bottomView)
        self.sendSubviewToBack(bottomView)
    }
}
