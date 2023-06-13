//
//  LessonsViewController.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit

class LessonsViewController: BaseViewController, Storyboarded {
    
    var lessonsTableView: BaseTableView!
    var viewModel: LessonsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = LessonsViewModel()
        let baseTableViewModel = BaseTableViewModel()
        baseTableViewModel.itemsArray = viewModel?.lessonsArray ?? []

        lessonsTableView = BaseTableView(frame: view.bounds, viewModel: baseTableViewModel)

        configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        configureNavBarTitle()
    }

    //MARK: - UI Configuration

    private func configureUI() {
        view.addSubview(lessonsTableView)
        view.backgroundColor = .primary
        
        lessonsTableView.layer.cornerRadius = 15

    }

    private func configureNavBarTitle() {

        guard let navBar = navigationController?.navigationBar else { return }

        title = "Lessons"
        navBar.prefersLargeTitles = true

        navBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro", size: 28) ?? UIFont.systemFont(ofSize: 28),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]

        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.tintColor = .white
        navBar.barTintColor = .primary
    }
}
