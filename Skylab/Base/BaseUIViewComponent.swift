//
//  BaseUIViewComponent.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 23/05/2023.
//

import UIKit

class BaseUIViewComponent: UIView {
    
    private var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        view = loadNib()
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}

extension UIView {
    
    func loadNib() -> UIView {
    let bundle = Bundle(for: type(of: self))

    guard let nibName = type(of: self).description().components(separatedBy: ".").last else { fatalError("NibName Not Found!") }
        
    let nib = UINib (nibName: nibName, bundle: bundle)
        
    guard let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView else { fatalError("First View Not Found!") }
        
    return nibView
        
    }
}
