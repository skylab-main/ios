//
//  FirstPageViewController.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import UIKit

class FirstPageViewController: BaseViewController, Storyboarded {

    var viewModel: FirstPageViewModel?

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
