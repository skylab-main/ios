//
//  TRLMenuTableViewCell.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 27/04/2023.
//

import UIKit

class TRLMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var cellMainView: UIView!
    @IBOutlet weak var doubleBorderView: UIView!
    @IBOutlet weak var cellMainViewBottomConstraint: NSLayoutConstraint!
    
    private let cornerRadius: CGFloat = 15
    private let customColor = UIColor.primary.cgColor
    
    func configureCell() {
        
        cellMainView.backgroundColor = .white
        cellMainView.addBorders(edges: [.right, .left], color: .primary)
        
        doubleBorderView.backgroundColor = .clear
        doubleBorderView.addBorders(edges: [.right], color: .primary)
    }
    
    func isThisLastCellInLastSection(_ last: Bool) {
        
        if last {
            
            cellMainViewBottomConstraint.constant = 3
            
            // Round bottom corners of cell
            cellMainView.layer.borderWidth = 0
            cellMainView.layer.cornerRadius = cornerRadius
            cellMainView.layoutIfNeeded()
            cellMainView.layer.addBorder(side: .bottom, thickness: 1,
                                         color: customColor,
                                         maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            cellMainView.layer.masksToBounds = true
            cellMainView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            
            doubleBorderView.layer.cornerRadius = cornerRadius
            doubleBorderView.layoutIfNeeded()
            doubleBorderView.layer.addBorder(side: .bottom, thickness: 1,
                                             color: customColor,
                                             maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            doubleBorderView.layer.masksToBounds = true
            doubleBorderView.layer.maskedCorners = [.layerMaxXMaxYCorner]
            
        } else {
            
            // If this is not the last cell in the last section
            
            cellMainViewBottomConstraint.constant = 0
            
            cellMainView.layer.maskedCorners = []
            cellMainView.layer.sublayers?.removeAll()
            cellMainView.addBorders(edges: [.right, .left], color: .primary)
            
            doubleBorderView.layer.maskedCorners = []
            doubleBorderView.layer.sublayers?.removeAll()
            doubleBorderView.addBorders(edges: [.right], color: .primary)
        }
    }
}
