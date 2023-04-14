//
//  PersonCell.swift
//  Skylab
//
//  Created by Artem Tkachenko on 14.04.2023.
//

import UIKit

class PersonCell: UICollectionViewCell {
    static var identifier = "PersonCell"
    
    let imageView = CircularImageView(frame: .zero, padding: 3)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = self.bounds
        self.addSubview(imageView)
    }
}
