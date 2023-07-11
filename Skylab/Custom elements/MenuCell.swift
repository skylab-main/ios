//
//  CustomCVCell.swift
//  Test
//
//  Created by Artem Tkachenko on 22.02.2023.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    static var identifier = "MenuCell"
    
    lazy var baseBackgroundView: DoubleBorderForView = {
        let view = DoubleBorderForView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderColor = .white
        view.bottomViewBackgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "AnonymousPro-Bold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createConstraints()
    }
    
    private func createConstraints() {
        self.addSubview(baseBackgroundView)
        baseBackgroundView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            baseBackgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            baseBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            baseBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -baseBackgroundView.distance),
            baseBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: baseBackgroundView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: baseBackgroundView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: baseBackgroundView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: baseBackgroundView.bottomAnchor)
        ])
    }

}
