//
//  AuthorizationAPIViewController.swift
//  Skylab
//
//  Created by Сергей Молодец on 29.07.2023.
//

import UIKit

class AuthorizationAPIViewController: BaseViewController, Storyboarded {
    
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var keyTextField: UITextField!
    @IBOutlet weak var manualButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - UI Configurations funcs
    private func configureUI() {
   configureContainerView()
configureNavigationBar()
    }
    
    private func configureContainerView() {
        self.view.backgroundColor = .primary
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 12
        containerView.clipsToBounds = true
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    private func configureNavigationBar() {
        navigationController?.navigationBar.primaryStyle()
        navigationItem.title = NSLocalizedString("ResultScene.UINavigationBar.Title", comment: "Title for checking task screeeen")
    }
    
    private func configureTopLabel() {
        topLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 14, textColor: .primary, nil)
        topLabel.text = NSLocalizedString("AuthorizationAPIViewController.topLabel.text", comment: "Text for the top label on the api key putting screen")
    }
    
    
}
