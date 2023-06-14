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
    
    func configureCell(data: QuizTopicsModel) {
        
        quizTopicLabel.text = data.topic
        quizTopicLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 14, textColor: .primary, nil)
        
        progressPercentLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 14, textColor: .primary, nil)
        progressPercentLabel.text = String(format: "%.0f", data.progress) + "%"
        
        progressBar.progressTintColor = .primary
        progressBar.trackTintColor = .systemGray4
        progressBar.progress = data.progress / 100
        
        cellBackgroundView.layer.configureViewLayer(cornerRadius: 12, borderWidth: 1, borderColor: .primary, true)
        cellBackgroundView.backgroundColor = .white
        
        doubleBorderView.layer.configureViewLayer(cornerRadius: 12, borderWidth: 1, borderColor: .primary, true)
        doubleBorderView.backgroundColor = .primary
        
    }
}
