//
//  FirstPageViewController.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import UIKit
import RxCocoa
import RxSwift

class FirstPageViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var openFirstSubControllerButton: UIButton!
    @IBOutlet weak var openSecondSubControllerButton: UIButton!
    
    var viewModel: FirstPageViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    private func setupBindings() {
        openFirstSubControllerButton.rx.tap
            .bind(to: viewModel.openFirstSubController)
            .disposed(by: bag)
        
        openSecondSubControllerButton.rx.tap
            .bind(to: viewModel.openSecondSubController)
            .disposed(by: bag)
    }

}
