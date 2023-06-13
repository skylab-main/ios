//
//  BaseTableViewCell.swift
//  Skylab
//
//  Created by Леонід Квіт on 01.06.2023.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPercentLabel: UILabel!
    @IBOutlet weak var itemProgressView: UIProgressView!
    
    func updateCell(title: String, progressValues: Int) {

        itemNameLabel.text = title
        itemPercentLabel.text = "\(progressValues)%"
        itemProgressView.progress = Float(progressValues)/100
        selectionStyle = .none
    }
}
