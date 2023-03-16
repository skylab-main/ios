//
//  SwinjectTestPageViewController.swift
//  Skylab
//
//  Created by Serhii Dorohobid on 27.01.2023.
//

import UIKit

class SwinjectTestPageViewController: BaseViewController, Storyboarded {
    var viewModel: SwinjectTestPageViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openFirstSubcontroller(_ sender: Any) {
        viewModel?.openFirstSubcontroller()
    }

    @IBAction func openSecondSubcontroller(_ sender: Any) {
        viewModel?.openSecondSubcontroller()
    }
}
