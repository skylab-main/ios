//
//  CustomCVCell.swift
//  Test
//
//  Created by Artem Tkachenko on 22.02.2023.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    static var identifier = "MenuCell"
    
    lazy var baseBackgroundView: BaseBackgroundView = {
        let view = BaseBackgroundView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderColor = .black
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Title"
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
            baseBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            baseBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: baseBackgroundView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: baseBackgroundView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: baseBackgroundView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: baseBackgroundView.bottomAnchor)
        ])
    }

}
