//
//  TopicsCollectionViewCell.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 13/04/2023.
//

import UIKit

class TopicsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topicTitleLabel: UILabel!
    @IBOutlet weak var topicsView: BaseBackgroundView!
    
    func updateCell(data: String) {
        
        topicTitleLabel.text = data
        topicTitleLabel.textColor = .primary
        topicTitleLabel.font = UIFont(name: "AnonymousPro-Bold", size: 20)
    }
    
}
