//
//  DataListCollectionViewCell.swift
//  Skylab
//
//  Created by Liza on 18.04.2023.
//

import UIKit

class DataListCollectionViewCell: UICollectionViewCell {
    
    private let padding: CGFloat = 16
    private let imageViewPadding: CGFloat = 19
    private let imageHeight: CGFloat = 18
    
    private var imageName: String? = nil {
        didSet{
            guard let imageName else {
                return
            }
            imageView.image = UIImage(named: imageName)
        }
    }
    private var title: String = "" {
        didSet{
            titleLabel.text = title
        }
    }
    private var progressValue: Float? = nil {
        didSet{
            guard let progressValue else {
                return
            }
            progressView.progress = progressValue
        }
    }
    
    func configure(title: String, imageName:String?, progressValue:Float?) {
        self.title = title
        self.imageName = imageName
        self.progressValue = progressValue
        
    }
   
    lazy var baseBackgroundView: BaseBackgroundView = {
        let view = BaseBackgroundView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderColor = .primary
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .primary
        label.font = UIFont(name: "AnonymousPro-Bold", size: 14)
        label.numberOfLines = 0
        return label
        
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .primary
        return progressView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpViews()
    }
    
    
    private func setUpViews() {
        self.addSubview(baseBackgroundView)
        
        let baseViewLeading = baseBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let baseViewTrailing = baseBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -baseBackgroundView.distance)
        let baseViewTop = baseBackgroundView.topAnchor.constraint(equalTo: self.topAnchor)
        let baseViewBottom = baseBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -baseBackgroundView.distance)
        
        NSLayoutConstraint.activate([baseViewTop, baseViewBottom, baseViewLeading, baseViewTrailing])
        
        addImageView()
        addProgressView()
        addLabel()
        
        
    }
    
    
    private func addImageView() {
        guard imageName != nil else {
            return
        }
        
        let top = imageView.topAnchor.constraint(equalTo: baseBackgroundView.topAnchor, constant: imageViewPadding)
        let leading = imageView.leadingAnchor.constraint(equalTo: baseBackgroundView.leadingAnchor, constant: imageViewPadding)
        let height = imageView.heightAnchor.constraint(equalToConstant: imageHeight)
        let width = imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1)
        
        baseBackgroundView.addSubview(imageView)
        NSLayoutConstraint.activate([top, leading, height, width])
      
        
        
    }
    
    private func addLabel() {
        
        baseBackgroundView.addSubview(titleLabel)
        
        let leading = titleLabel.leadingAnchor.constraint(equalTo: baseBackgroundView.leadingAnchor, constant: padding)
        let trailing = titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: baseBackgroundView.trailingAnchor, constant: -padding)
        var bottom = titleLabel.bottomAnchor.constraint(equalTo: baseBackgroundView.bottomAnchor, constant: -padding)
        var top  = titleLabel.topAnchor.constraint(greaterThanOrEqualTo: baseBackgroundView.topAnchor, constant: padding)
        
        if progressValue != nil  {
            bottom = titleLabel.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -15)
        }
        
        if imageName != nil {
            top = titleLabel.topAnchor.constraint(greaterThanOrEqualTo: imageView.bottomAnchor, constant: padding)
        }
        
        NSLayoutConstraint.activate([leading, trailing, bottom, top])
    }
    
    private func addProgressView() {
        guard progressValue != nil else {
            return
        }
        
        let leading = progressView.leadingAnchor.constraint(equalTo: baseBackgroundView.leadingAnchor, constant: padding)
        let bottom = progressView.bottomAnchor.constraint(equalTo: baseBackgroundView.bottomAnchor, constant: -padding)
        let trailing = progressView.trailingAnchor.constraint(equalTo: baseBackgroundView.trailingAnchor, constant: -padding)
    
        baseBackgroundView.addSubview(progressView)
        NSLayoutConstraint.activate([leading, bottom, trailing])
        
    }
    
    

}
