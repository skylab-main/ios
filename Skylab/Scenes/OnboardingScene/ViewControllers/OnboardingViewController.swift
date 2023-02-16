//
//  OnboardingViewController.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import UIKit

class OnboardingViewController: BaseViewController, Storyboarded {
    var viewModel: OnboardingViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.openAuthorizationController()
    }
}
