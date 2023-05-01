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
    @IBOutlet weak var doubleBorderView: UIView!
    @IBOutlet weak var topCornersOfHeaderView: UIView!
    @IBOutlet weak var bottomDoubleBorderViewConstraint: NSLayoutConstraint!
    
    var delegate: TRLMenuCustomHeaderDelegate?
    
    private var expanded: Bool?
    private let cornerRadius: CGFloat = 15
    private let customColor = UIColor.primary.cgColor
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Check if this is the first header view
        if tag == 1 {

            headerBackgroundView.layer.cornerRadius = cornerRadius
            headerBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            doubleBorderView.layer.cornerRadius = cornerRadius
            doubleBorderView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            if expanded ?? false {

                headerBackgroundView.layer.cornerRadius = cornerRadius
                headerBackgroundView.layer.masksToBounds = true

                topCornersOfHeaderView.layer.borderColor = customColor
                topCornersOfHeaderView.layer.borderWidth = 1
                topCornersOfHeaderView.layer.cornerRadius = cornerRadius
            }
        }

        // Check if this is the last header view
        if tag == 2 {

            headerBackgroundView.layer.cornerRadius = cornerRadius
            headerBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            
            doubleBorderView.layer.cornerRadius = cornerRadius
            doubleBorderView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            
            if expanded ?? false {
                
                doubleBorderView.layer.maskedCorners = []
            }
        }
    }
    
    //MARK: - View configurations

    func configure(title: String, section: Int) {
        
        topicLabel.text = title
        topicLabel.font = UIFont(name: "AnonymousPro-Bold", size: 16)
        topicLabel.textColor = .primary
        
        headerButton.tag = section
        headerButton.setTitle("", for: .normal)
        
        headerBackgroundView.backgroundColor = .white
        headerBackgroundView.layer.borderWidth = 1
        headerBackgroundView.layer.borderColor = customColor
        
        doubleBorderView.backgroundColor = .clear
        doubleBorderView.layer.borderWidth = 1
        doubleBorderView.layer.borderColor = customColor
    }
    
    func rotateImage(_ expanded: Bool) {
        
        self.expanded = expanded
        
        if expanded {
            
            headerButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
            
            headerBackgroundView.layer.borderWidth = 0
            headerBackgroundView.addBorders(edges: [.top, .left, .right], color: .primary)
 
        } else {
            
            headerButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }
    }
    
    //MARK: - IBAction
    
    @IBAction func tapHeader(sender: UIButton) {
        
        delegate?.expandedSection(button: sender)
    }
    
}
