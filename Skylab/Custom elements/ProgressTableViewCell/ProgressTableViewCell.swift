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
    
    var viewModel: ProgressItemViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            
            itemNameLabel.text = viewModel.title
            itemNameLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 14, textColor: .primary, nil)
            
            itemPercentLabel.text = viewModel.progress
            itemPercentLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 14, textColor: .primary, nil)
            
            itemProgressView.progressTintColor = .primary
            itemProgressView.trackTintColor = .systemGray4
            itemProgressView.progress = viewModel.progressValue
        }
    }
}
