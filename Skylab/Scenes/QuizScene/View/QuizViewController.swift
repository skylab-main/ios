//
//  QuizViewController.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit

class QuizViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var helpfulResourcesButton: UIButton!
    
    var viewModel: QuizViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNavBarTitle()
    }
    
    private func configureUI() {
        
        self.view.backgroundColor = .primary
   
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.cornerRadius = 12
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        helpfulResourcesButton.configureButton(title: "Корисні ресурси",
                                               imageName: "rightArrow",
                                               fontName: "AnonymousPro-Bold",
                                               fontSize: 14,
                                               tintColor: .primary)
        
    }
    
    private func configureNavBarTitle() {
            
        guard let navBar = navigationController?.navigationBar else { return }

        navigationItem.title = "Quiz"
        navBar.prefersLargeTitles = true
 
        navBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro-Bold", size: 28) ?? UIFont.systemFont(ofSize: 28),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        navigationItem.setValuesForKeys(["__largeTitleTwoLineMode": true])

        navBar.tintColor = .white

    }
}
