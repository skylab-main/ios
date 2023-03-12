//
//  TestMenuViewController.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.03.2023.
//

import UIKit

class TestMenuViewController: BaseViewController, Storyboarded, ScrollableMenuViewDelegate {
    
    @IBOutlet weak var scrollableMenuView: ScrollableMenuView!
    
    func changeColor(index: Int) {
        view.backgroundColor = scrollableMenuView.colors[index]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollableMenuView.delegate = self
        view.backgroundColor = scrollableMenuView.colors[0]
    }

}
