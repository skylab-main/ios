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
    @IBOutlet weak var bottomCoverViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var doubleBorderViewTopConstraint: NSLayoutConstraint!
    
    weak var delegate: TRLMenuCustomHeaderDelegate?
    
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
            
            doubleBorderViewTopConstraint.constant = 3
            
            if expanded ?? false {

                headerBackgroundView.layer.cornerRadius = cornerRadius
                headerBackgroundView.layoutIfNeeded()
                headerBackgroundView.layer.addBorder(side: .top, thickness: 1,
                                                     color: customColor,
                                                     maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
                
                doubleBorderView.layoutIfNeeded()
                doubleBorderView.layer.addBorder(side: .top, thickness: 1,
                                                 color: customColor,
                                                 maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
                doubleBorderView.layer.cornerRadius = cornerRadius
                doubleBorderView.layer.masksToBounds = true
                doubleBorderView.layer.maskedCorners = [.layerMaxXMinYCorner]
            }
        }

        // Check if this is the last header view
        if tag == 2 {

            headerBackgroundView.layer.cornerRadius = cornerRadius
            headerBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            
            doubleBorderView.layer.cornerRadius = cornerRadius
            doubleBorderView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            
            bottomCoverViewConstraint.constant = 3
            
            if expanded ?? false {
                
                headerBackgroundView.layer.maskedCorners = []
                doubleBorderView.layer.maskedCorners = []
            }
        }
    }
    
    //MARK: - View configurations

    func configureHeader(title: String, section: Int) {
        
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
        
        doubleBorderViewTopConstraint.constant = 0
    }
    
    func rotateImage(_ expanded: Bool) {
        
        self.expanded = expanded
        
        if expanded {
            
            headerButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
            
            headerBackgroundView.layer.borderWidth = 0
            headerBackgroundView.addBorders(edges: [.top, .left, .right], color: .primary)
            headerBackgroundView.layer.masksToBounds = true
            headerBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            doubleBorderView.layer.borderWidth = 0
            doubleBorderView.addBorders(edges: [.right], color: .primary)
            doubleBorderView.layer.masksToBounds = true
            doubleBorderView.layer.maskedCorners = [.layerMaxXMinYCorner]
            
        } else {
            
            headerButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }
    }
    
    //MARK: - IBAction
    
    @IBAction func tapHeader(sender: UIButton) {
        
        delegate?.expandedSection(button: sender)
    }
    
}
