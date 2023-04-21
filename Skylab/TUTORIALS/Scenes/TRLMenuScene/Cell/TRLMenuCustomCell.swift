//
//  TRLMenuCustomCell.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 21/04/2023.
//

import UIKit

protocol TRLMenuCustomCellDelegate {
    func expandedSection(button: UIButton)
    
}

class TRLMenuCustomCell: UITableViewHeaderFooterView {

    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    
    var delegate: TRLMenuCustomCellDelegate?
    
    func configure(title: String, section: Int) {
        topicLabel.text = title
        cellButton.tag = section
    }
    
    @IBAction func cellButtonAction(_ sender: UIButton) {
        
        delegate?.expandedSection(button: sender)
    }
    
}
