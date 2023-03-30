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
    
    @IBOutlet weak var toggleLabel: UILabel!
    @IBOutlet weak var openFirstSubControllerButton: UIButton!
    @IBOutlet weak var openSecondSubControllerButton: UIButton!
    
    var viewModel: FirstPageViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
    }
    
    private func setupBindings() {
        openFirstSubControllerButton.rx.tap
            .bind(to: viewModel.openFirstSubController)
            .disposed(by: bag)
        
        openSecondSubControllerButton.rx.tap
            .bind(to: viewModel.openSecondSubController)
            .disposed(by: bag)
        
        viewModel.toggleLabelIsHidden.asDriver().drive(toggleLabel.rx.isHidden).disposed(by: bag)
        
    }
}
