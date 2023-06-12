//
//  FirstPageSubViewController.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 08.01.2023.
//

import UIKit

class FirstPageSubViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var containerView: UIView!
    var viewModel: FirstPageSubViewControllerViewModel?
    let mainColor = UIColor(red: 0.063, green: 0.267, blue: 0.6, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //configureNavBarTitle()
        //setupUI()
    }

    private func configureNavBarTitle() {
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.prefersLargeTitles = true
        navigationItem.title = "Simple animations: element position, color, size."
        navigationItem.setValuesForKeys(["__largeTitleTwoLineMode": true])

        navBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
       
        let backButtonImage = UIImage(systemName: "arrow.backward")
        navBar.backIndicatorImage = backButtonImage
        navBar.backIndicatorTransitionMaskImage = backButtonImage
        navBar.tintColor = .white
        navBar.barStyle = .black
        
    }

    private func setupUI() {
        view.layer.backgroundColor = mainColor.cgColor
        containerView.layer.cornerRadius = 16
    }
}
