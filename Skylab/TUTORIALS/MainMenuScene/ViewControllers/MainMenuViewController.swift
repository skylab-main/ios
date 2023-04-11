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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    private func configureUI() {
        
        applicationButton.layer.cornerRadius = 15
        tutorialButton.layer.cornerRadius = 15
    }
    
    @IBAction func mainMenuButtonsAction(_ sender: UIButton) {
        
        switch sender.tag {
            
        case 0:
            let vc = UIStoryboard(name: "ApplicationViewController",
                                  bundle: nil).instantiateViewController(withIdentifier: "ApplicationViewController")
            
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = UIStoryboard(name: "TutorialViewController",
                                  bundle: nil).instantiateViewController(withIdentifier: "TutorialViewController")
            
            navigationController?.pushViewController(vc, animated: true)
        default: return
        }
    }
    
}
