//
//  ThirdPageViewController.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import UIKit

class ThirdPageViewController: BaseViewController, Storyboarded {
    
    var viewModel: ThirdPageViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func openFirstSubController(_ sender: UIButton) {
        viewModel?.openFirstSubcontroller()
    }
}
