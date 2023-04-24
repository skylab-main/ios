//
//  TRLMenuCustomTableViewCell.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 24/04/2023.
//

import UIKit

protocol TRLMenuCustomCellDelegate: AnyObject {
    
    func expandedSection(button: UIButton)
}

class TRLMenuCustomTableViewCell: UITableViewHeaderFooterView {
    
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var headerButton: UIButton!
    @IBOutlet weak var cellBackgroundView: UIView!
    
    var delegate: TRLMenuCustomCellDelegate?
    
    func configure(title: String, section: Int) {
        topicLabel.text = title
        headerButton.tag = section
        
        cellBackgroundView.layer.borderWidth = 1
        cellBackgroundView.layer.borderColor = CGColor(red: 16/255, green: 68/255, blue: 153/255, alpha: 1)
        
        headerButton.setTitle("", for: .normal)
        
    }
    
    func rotateImage(_ expanded: Bool) {
        
        if expanded {
            headerButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        } else {
            headerButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }
    }
    
    @IBAction func tapHeader(sender: UIButton) {
        
        delegate?.expandedSection(button: sender)
    }
    
}
