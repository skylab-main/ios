//
//  ReviewsCollectionViewCell.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 24/05/2023.
//

import UIKit

class ReviewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var reviewsView: UIView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var reviewerNameLabel: UILabel!
    @IBOutlet weak var reviewerImageBackgroundView: UIView!
    @IBOutlet weak var reviewerImageView: UIImageView!
    
    func configureCell(model: ReviewModel) {
        
        reviewLabel.text = model.review
        reviewerNameLabel.text = model.reviewer
        
        reviewsView.backgroundColor = .white
        reviewsView.layer.configureViewLayer(cornerRadius: 12,
                                             borderWidth: 1,
                                             borderColor: .primary, nil)
        
        reviewerImageBackgroundView
            .layer
            .configureViewLayer(cornerRadius: reviewerImageBackgroundView.frame.size.height / 2,
                                                             borderWidth: 1,
                                                             borderColor: .primary, nil)
        
        reviewerImageView.layer.cornerRadius = reviewerImageView.frame.size.height / 2
        
        reviewLabel.configureCustomLabel(font: .anonymousProBold,
                                         fontSize: 14,
                                         textColor: .primary, 4)

        reviewerNameLabel.configureCustomLabel(font: .anonymousProBold,
                                               fontSize: 14,
                                               textColor: .primary, nil)
    }
}
