//
//  TestMenuViewController.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.03.2023.
//

import UIKit

class TestMenuViewController: BaseViewController, Storyboarded , ScrollableMenuViewDelegate {
    
    func changeColor(index: Int) {
        view.backgroundColor = self.colors[index]
    }
    
    var scrollableMenuView = ScrollableMenuView()
    var colors = [UIColor.systemRed, .systemBrown, .systemTeal, .systemOrange, .systemBlue]

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollableMenuView.delegate = self
        view.backgroundColor = colors[0]
        scrollableMenuView.colors = self.colors
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollableMenuView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollableMenuView)
        NSLayoutConstraint.activate([
            scrollableMenuView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollableMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollableMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollableMenuView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }

}
