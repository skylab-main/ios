//
//  PersonCell.swift
//  Skylab
//
//  Created by Artem Tkachenko on 13.04.2023.
//

import UIKit

class PersonCell: UICollectionViewCell {
    static var identifier = "PersonCell"
    
    let imageView: CircularImageView = {
        let imageView = CircularImageView(frame: .zero, padding: 3.5)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
