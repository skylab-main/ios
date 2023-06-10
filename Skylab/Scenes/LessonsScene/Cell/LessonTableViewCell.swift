//
//  LessonTableViewCell.swift
//  Skylab
//
//  Created by Леонід Квіт on 01.06.2023.
//

import UIKit

class LessonTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lessonNameLabel: UILabel!
    @IBOutlet weak var lessonView: UIView!
    @IBOutlet weak var lessonPercentLabel: UILabel!
    @IBOutlet weak var lessonProgressView: UIProgressView!
    
    func updateCell(title: String, progressValues: Int) {
        
        lessonNameLabel.text = title
        lessonNameLabel.font = UIFont(name: "AnonymousPro", size: 14)
        lessonNameLabel.numberOfLines = 0
        lessonNameLabel.textColor = .primary
        
        lessonPercentLabel.text = "\(progressValues)%"
        lessonPercentLabel.font = UIFont(name: "AnonymousPro", size: 14)
        lessonPercentLabel.textColor = .primary

        lessonProgressView.progress = Float(progressValues)/100
        lessonProgressView.tintColor = .primary

        selectionStyle = .none

    }
}
