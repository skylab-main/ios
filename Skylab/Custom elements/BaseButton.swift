//
//  BaseButton.swift
//  Skylab
//
//  Created by Artem Tkachenko on 14.04.2023.
//

import UIKit

class BaseButton: UIView {
    
    let baseView = BaseBackgroundView()
    
    init(text: String) {
        textlabel.text = text
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let textlabel: UILabel = {
        let label = UILabel()
        label.textColor = .primary
        label.numberOfLines = 0
        label.font = AnonymousPro.bold(size: 14).font()
        label.textAlignment = .center
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        baseView.frame = self.bounds
        self.addSubview(baseView)
        textlabel.frame = baseView.bounds
        baseView.addSubview(textlabel)
    }
    
}
