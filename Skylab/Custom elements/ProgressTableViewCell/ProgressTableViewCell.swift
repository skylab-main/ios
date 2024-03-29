//
//  BaseTableViewCell.swift
//  Skylab
//
//  Created by Леонід Квіт on 01.06.2023.
//

import UIKit

class ProgressTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPercentLabel: UILabel!
    @IBOutlet weak var itemProgressView: UIProgressView!
    @IBOutlet weak var progressViewBottomConstraint: NSLayoutConstraint!
    
    func configureCell(title: String, progress: Float? = nil) {
        
        itemNameLabel.text = title
        itemNameLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 14, textColor: .primary, nil)
        
        if let progressValue = progress, progressValue > 0.0 {
            itemPercentLabel.isHidden = false
            itemProgressView.isHidden = false
            
            progressViewBottomConstraint.constant = 18
            
            itemPercentLabel.text = String(format: "%.0f", progressValue) + "%"
            itemPercentLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 14, textColor: .primary, nil)
            
            itemProgressView.progressTintColor = .primary
            itemProgressView.trackTintColor = .systemGray4
            itemProgressView.progress = progressValue / 100
        } else {
            itemPercentLabel.isHidden = true
            itemProgressView.isHidden = true
            progressViewBottomConstraint.constant = 0
        }
    }
}
