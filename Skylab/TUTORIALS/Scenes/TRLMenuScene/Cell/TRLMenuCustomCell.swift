//
//  TRLMenuCustomCell.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 21/04/2023.
//

import UIKit

class TRLMenuCustomCell: UITableViewCell {

    @IBOutlet weak var topicLabel: UILabel!
    
    func configureCell(title: String) {
        topicLabel.text = title
    }
    
}
