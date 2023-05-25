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
    
    private let customFont = UIFont(name: "AnonymousPro-Bold", size: 14)
    
    func configureCell() {
        
        reviewsView.backgroundColor = .white
        reviewsView.layer.masksToBounds = true
        reviewsView.layer.cornerRadius = 12
        reviewsView.layer.borderWidth = 1
        reviewsView.layer.borderColor = UIColor.primary.cgColor
        
        reviewerImageBackgroundView.layer.borderColor = UIColor.primary.cgColor
        reviewerImageBackgroundView.layer.borderWidth = 1
        reviewerImageBackgroundView.layer.cornerRadius = reviewerImageBackgroundView.frame.size.height / 2
        
        reviewerImageView.layer.cornerRadius = reviewerImageView.frame.size.height / 2
        
        reviewLabel = ServiceManager.shared.configureCustom(reviewLabel,
                                                            font: .anonymousProBold,
                                                            fontSize: 14,
                                                            textColor: .primary, 4)
        
        reviewerNameLabel = ServiceManager.shared.configureCustom(reviewerNameLabel,
                                                                  font: .anonymousProBold,
                                                                  fontSize: 14,
                                                                  textColor: .primary, nil)
    }
}
