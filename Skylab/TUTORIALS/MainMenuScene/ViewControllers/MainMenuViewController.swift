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
    }
    
    private func configureUI() {
        
        applicationButton.layer.cornerRadius = 15
        tutorialButton.layer.cornerRadius = 15
    }
    
    @IBAction func mainMenuButtonsAction(_ sender: UIButton) {
        
        viewModel?.openViewController(tag: sender.tag)
    }
    
}
