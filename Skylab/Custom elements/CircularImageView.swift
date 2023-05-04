//
//  CircularImageView.swift
//  Skylab
//
//  Created by Artem Tkachenko on 13.04.2023.
//

import UIKit

final class CircularImageView: UIView {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemBrown
        return imageView
    }()
    var image = UIImage() {
        didSet {
            imageView.image = image
        }
    }
    private let padding: CGFloat
    
    init(frame: CGRect, padding: CGFloat) {
        self.padding = padding
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
        setupView()
    }
    private func setupView() {
        self.layer.borderColor = UIColor.primary.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = frame.height / 2
        self.clipsToBounds = true
        imageView.layer.cornerRadius = (frame.height-padding*2)/2
    }
    private func setupConstraints() {
        self.addSubview(imageView)
        let imageViewConstraints = [
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ]
        NSLayoutConstraint.activate(imageViewConstraints)
    }
}
