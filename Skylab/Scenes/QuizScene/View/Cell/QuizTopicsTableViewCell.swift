//
//  QuizTopicsTableViewCell.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 12/06/2023.
//

import UIKit

class QuizTopicsTableViewCell: UITableViewCell {

    @IBOutlet weak var quizTopicLabel: UILabel!
    @IBOutlet weak var progressPercentLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var doubleBorderView: UIView!
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var quizTopicAndImageStackTopConstraint: NSLayoutConstraint!
    
    private let defaultConstrainValue: CGFloat = 16
    private let labelsFontSize: CGFloat = 14
    private let cornerRadius: CGFloat = 12
    private let borderWidth: CGFloat = 1
    private let estimateCellBackgroundViewHeight: CGFloat = 75
    private var defaultCellBackgroundViewHeight: CGFloat = 0
    
    func configureCell(data: QuizTopicsModel) {
        
        if cellBackgroundView.frame.size.height < estimateCellBackgroundViewHeight {
            
                defaultCellBackgroundViewHeight = cellBackgroundView.frame.size.height
            } else {
                
                defaultCellBackgroundViewHeight = estimateCellBackgroundViewHeight
            }

        if (data.progress * 100) == 0 {
        
            progressPercentLabel.isHidden = true
            progressBar.isHidden = true
            
            quizTopicAndImageStackTopConstraint.constant = defaultCellBackgroundViewHeight / 2
        } else {

            quizTopicAndImageStackTopConstraint.constant = defaultConstrainValue
            
            progressPercentLabel.isHidden = false
            progressBar.isHidden = false
        }
        
        quizTopicLabel.text = data.chosenTopicTitle
        quizTopicLabel.configureCustomLabel(font: .anonymousProBold, fontSize: labelsFontSize, textColor: .primary, nil)
        
        progressPercentLabel.configureCustomLabel(font: .anonymousProBold, fontSize: labelsFontSize, textColor: .primary, nil)
        progressPercentLabel.text = String(format: "%.0f", (data.progress * 100)) + "%"
        
        progressBar.progressTintColor = .primary
        progressBar.trackTintColor = .systemGray4
        progressBar.progress = data.progress
        
        cellBackgroundView.layer.configureViewLayer(cornerRadius: cornerRadius, borderWidth: borderWidth, borderColor: .primary, true)
        cellBackgroundView.backgroundColor = .white
        
        doubleBorderView.layer.configureViewLayer(cornerRadius: cornerRadius, borderWidth: borderWidth, borderColor: .primary, true)
        doubleBorderView.backgroundColor = .primary
        
    }
}
