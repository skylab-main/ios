//
//  TRLMenuCustomTableViewCell.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 24/04/2023.
//

import UIKit

class TRLMenuCustomTableViewHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var headerButton: UIButton!
    @IBOutlet weak var headerBackgroundView: UIView!
    
    weak var delegate: TRLMenuCustomHeaderDelegate?
    
    private var expanded: Bool?
    private let cornerRadius: CGFloat = 15
    private let customColor = UIColor.primary.cgColor
    private let borderThickness: CGFloat = 1
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundHeaderCornersAndSetBorders(tag)
    }
    
    //MARK: - View configurations
    
    func configureHeader(title: String, section: Int) {
        
        topicLabel.text = title
        topicLabel.font = UIFont(name: "AnonymousPro-Bold", size: 14)
        topicLabel.textColor = .primary
        
        headerButton.tag = section
        headerButton.setTitle("", for: .normal)
        headerButton.imageEdgeInsets.right = 23
        
        headerBackgroundView.backgroundColor = .white
    }
    
    private func roundHeaderCornersAndSetBorders(_ tag: Int) {
        
        switch tag {
            
        case 1: // This is the first header view
            headerBackgroundView.layer.cornerRadius = cornerRadius
            headerBackgroundView.layoutIfNeeded()
            headerBackgroundView.layer.addBorder(side: .leftAndRight, thickness: borderThickness, color: customColor)
            headerBackgroundView.layer.addBorder(side: .top, thickness: borderThickness,
                                                 color: customColor,
                                                 maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
            
            headerBackgroundView.clipsToBounds = true
            headerBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            if expanded ?? false {
                
                headerBackgroundView.layer.cornerRadius = cornerRadius
                headerBackgroundView.layoutIfNeeded()
                headerBackgroundView.layer.addBorder(side: .top, thickness: borderThickness,
                                                     color: customColor,
                                                     maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
            }
        case 2: // This is the last header view
            headerBackgroundView.layer.borderWidth = 1
            headerBackgroundView.layer.borderColor = customColor
            headerBackgroundView.layer.cornerRadius = cornerRadius
            headerBackgroundView.layer.masksToBounds = true
            headerBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            
            if expanded ?? false {
                
                headerBackgroundView.layer.borderWidth = 0
                headerBackgroundView.layoutIfNeeded()
                headerBackgroundView.layer.addBorder(side: .leftAndRight, thickness: borderThickness, color: customColor)
                headerBackgroundView.layer.addBorder(side: .top, thickness: borderThickness, color: customColor)
                headerBackgroundView.layer.maskedCorners = []
            }
        default:
            headerBackgroundView.layoutIfNeeded()
            headerBackgroundView.layer.addBorder(side: .leftAndRight, thickness: borderThickness, color: customColor)
            headerBackgroundView.layer.addBorder(side: .top, thickness: borderThickness, color: customColor)
        }
    }
    
    func rotateImage(_ expanded: Bool) {
        
        self.expanded = expanded
        
        if expanded {
            
            headerButton.setImage(UIImage(named: "chevronUp"), for: .normal)
        } else {
            
            headerButton.setImage(UIImage(named: "chevronDown"), for: .normal)
        }
    }
    
    //MARK: - IBAction
    
    @IBAction func tapHeader(sender: UIButton) {
        
        delegate?.expandedSection(button: sender)
    }
    
}
