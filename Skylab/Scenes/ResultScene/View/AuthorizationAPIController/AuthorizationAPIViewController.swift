//
//  AuthorizationAPIViewController.swift
//  Skylab
//
//  Created by Сергей Молодец on 29.07.2023.
//

import UIKit

class AuthorizationAPIViewController: BaseViewController, Storyboarded {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
 
    // MARK: - UI Configurations funcs
    private func configureUI() {
        self.view.backgroundColor = .primary
//        containerView.backgroundColor = .white
//        containerView.layer.cornerRadius = 12
//        containerView.clipsToBounds = true
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
    }

}
