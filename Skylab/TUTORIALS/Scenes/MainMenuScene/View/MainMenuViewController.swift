//
//  MainMenuViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 10/04/2023.
//

import UIKit

class MainMenuViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var applicationButton: UIButton!
    @IBOutlet weak var tutorialButton: UIButton!
    
    var viewModel: MainMenuViewModelProtocol? 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureNavBarTitle()
    }
    
    //MARK: - UI Configuration
    
    private func configureUI() {
 
        applicationButton.layer.cornerRadius = 15
        applicationButton.titleLabel?.font = UIFont(name: "AnonymousPro-Bold", size: 20)
        tutorialButton.layer.cornerRadius = 15
        tutorialButton.titleLabel?.font = UIFont(name: "AnonymousPro-Bold", size: 20)
        
    }
    
    private func configureNavBarTitle() {
        
        guard let navBar = navigationController?.navigationBar else { return }
        
        navigationItem.title = "Main Menu"
        
        navBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.black,
        ]
        
        let backButtonImage = UIImage(systemName: "arrow.backward")
        navBar.backIndicatorImage = backButtonImage
        navBar.backIndicatorTransitionMaskImage = backButtonImage
        navBar.tintColor = .black
        navBar.barStyle = .black
        navigationItem.backButtonTitle = ""
    }
    
    //MARK: - IBActions
    
    @IBAction func mainMenuButtonsAction(_ sender: UIButton) {
        
        viewModel?.openViewController(tag: sender.tag)
    }
    
}
