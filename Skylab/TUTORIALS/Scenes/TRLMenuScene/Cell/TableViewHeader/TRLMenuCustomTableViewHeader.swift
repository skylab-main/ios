//
//  TRLMenuCustomTableViewCell.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 24/04/2023.
//

import UIKit

protocol TRLMenuCustomHeaderDelegate: AnyObject {
    
    func expandedSection(button: UIButton)
}

class TRLMenuCustomTableViewHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var headerButton: UIButton!
    @IBOutlet weak var headerBackgroundView: UIView!
    @IBOutlet weak var secondHeaderBackgroundView: UIView!
    
    var delegate: TRLMenuCustomHeaderDelegate?
    private var expanded: Bool!
    private var cornerRadius: CGFloat = 15
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Check if this is the first header view
        if tag == 1 {
        
            headerBackgroundView.layer.cornerRadius = cornerRadius
            headerBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            secondHeaderBackgroundView.layer.cornerRadius = cornerRadius
            secondHeaderBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            if expanded {

                headerBackgroundView.layer.borderWidth = 0
                headerBackgroundView.addBorders(edges: [.top, .left, .right], color: .primary)
                headerBackgroundView.layer.cornerRadius = cornerRadius
                headerBackgroundView.layer.masksToBounds = true
                
                secondHeaderBackgroundView.layer.borderWidth = 0
                secondHeaderBackgroundView.addBorders(edges: [.top, .left, .right], color: .primary)
                secondHeaderBackgroundView.layer.cornerRadius = cornerRadius
                secondHeaderBackgroundView.layer.masksToBounds = true

            }
        }
        
        // Check if this is the last header view
        if tag == 2 {
            headerBackgroundView.layer.cornerRadius = cornerRadius
            headerBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            
            secondHeaderBackgroundView.layer.cornerRadius = cornerRadius
            secondHeaderBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }

    func configure(title: String, section: Int) {
        
        topicLabel.text = title
        headerButton.tag = section
        
        headerBackgroundView.layer.borderWidth = 1
        headerBackgroundView.layer.borderColor = UIColor.primary.cgColor
        
        secondHeaderBackgroundView.backgroundColor = .clear
        secondHeaderBackgroundView.layer.borderWidth = 1
        secondHeaderBackgroundView.layer.borderColor = UIColor.primary.cgColor
        
        headerButton.setTitle("", for: .normal)
        
        headerBackgroundView.backgroundColor = .white
    }
    
    func rotateImage(_ expanded: Bool) {
        
        self.expanded = expanded
        
        if expanded {
            
            headerButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
            
            headerBackgroundView.layer.borderWidth = 0
            headerBackgroundView.addBorders(edges: [.top, .left, .right], color: .primary)

            secondHeaderBackgroundView.layer.borderWidth = 0
            secondHeaderBackgroundView.addBorders(edges: [.top, .left, .right], color: .primary)

            
        } else {
            headerButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }
    }
    
    @IBAction func tapHeader(sender: UIButton) {
        
        delegate?.expandedSection(button: sender)
    }
    
}
