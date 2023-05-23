//
//  CourseDescriptionViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 23/05/2023.
//

import UIKit

class CourseDescriptionViewController: BaseViewController, Storyboarded {
    
    @IBOutlet var customView: CustomAboutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    private func configureUI () {
    
        customView.configureUI()
    }

}
