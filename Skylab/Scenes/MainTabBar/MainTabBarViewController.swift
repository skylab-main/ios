//
//  MainTabBarViewController.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        self.viewControllers = [UIViewController()]
        self.viewControllers = []
        tabBar.backgroundColor = .white
        tabBar.layer.addBorder(side: .top, thickness: 1, color: UIColor.systemGray5.cgColor)
        tabBar.tintColor = .dark
        tabBar.unselectedItemTintColor = .dark
    }
}

enum TabBarItems: String {
    case quiz, lessons, practice, about
    var image: UIImage? {
        switch self {
        case .quiz:
            return UIImage(named: "quiz")
        case .lessons:
            return UIImage(named: "lessons")
        case .practice:
            return UIImage(named: "practice")
        case .about:
            return UIImage(named: "about")
        }
    }
    var selectedImage: UIImage? {
        switch self {
        case .quiz:
            return UIImage(named: "quiz.selected")
        case .lessons:
            return UIImage(named: "lessons.selected")
        case .practice:
            return UIImage(named: "practice.selected")
        case .about:
            return UIImage(named: "about.selected")
        }
    }
}
