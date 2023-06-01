//
//  CourseDetailsTableViewCell.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 01/06/2023.
//

import UIKit

class CourseDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellMainView: UIView!
    
    private let cornerRadius: CGFloat = 15
    private let customColor = UIColor.primary.cgColor
    private let borderThickness: CGFloat = 1
    
    func configureCell() {
        
        cellMainView.backgroundColor = .white
    }
    
    func isThisLastCellInLastSection(_ last: Bool) {
        
        if last {
            // If this is the last cell in the last section
            
            // Round bottom corners of cell
            cellMainView.layer.sublayers?.removeAll()
            cellMainView.layer.cornerRadius = cornerRadius
            cellMainView.layoutIfNeeded()
            cellMainView.layer.addBorder(side: .leftAndRight, thickness: borderThickness, color: customColor)
            cellMainView.layer.addBorder(side: .bottom, thickness: borderThickness,
                                         color: customColor,
                                         maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            cellMainView.layer.masksToBounds = true
            cellMainView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        } else {
            // If this is not the last cell in the last section
            
            cellMainView.layer.sublayers?.removeAll()
            cellMainView.layoutIfNeeded()
            cellMainView.layer.addBorder(side: .leftAndRight, thickness: borderThickness, color: customColor)
        }
    }
}
