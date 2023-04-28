//
//  TRLMenuTableViewCell.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 27/04/2023.
//

import UIKit

class TRLMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var secondCellBackgroundView: UIView!
    @IBOutlet weak var doubleBorderView: UIView!
    
    
    @IBOutlet weak var cellBackgroundViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var doubleBorderBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var secondCellViewBottomConstraint: NSLayoutConstraint!
    
    
}
