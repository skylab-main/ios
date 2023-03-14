//
//  TestMenuViewController.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.03.2023.
//

import UIKit

class TestMenuViewController: BaseViewController, Storyboarded, ScrollableMenuViewDelegate {
    
    @IBOutlet weak var scrollableMenuView: ScrollableMenuView!
    
    func getIndex(_ index: Int) {
        view.backgroundColor = colors[index]
    }
    
    var colors = [UIColor.systemRed, .systemBrown, .systemTeal, .systemOrange, .systemBlue]

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollableMenuView.delegate = self
        scrollableMenuView.colors = self.colors
        view.backgroundColor = colors[0]
    }

}
