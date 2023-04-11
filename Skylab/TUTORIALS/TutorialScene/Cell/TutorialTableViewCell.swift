//
//  TutorialTableViewCell.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 11/04/2023.
//

import UIKit

class TutorialTableViewCell: UITableViewCell {

    @IBOutlet weak var topicNameLabel: UILabel!
    @IBOutlet weak var topicView: UIView!
    
    func updateCell(data: String) {
        
        topicNameLabel.text = data
        
        topicView.layer.cornerRadius = 15
    }
    
}
