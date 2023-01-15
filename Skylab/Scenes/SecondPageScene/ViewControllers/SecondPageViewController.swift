//
//  SecondPageViewController.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import UIKit

class SecondPageViewController: BaseViewController, Storyboarded {
    
    var viewModel: SecondPageViewModel?


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func openFirstSubcontroller(_ sender: Any) {
        viewModel?.openFirstSubcontroller()
    }
    
}
