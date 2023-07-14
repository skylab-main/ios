//
//  LessonsLevelViewController.swift
//  Skylab
//
//  Created by Леонід Квіт on 13.07.2023.
//

import UIKit

class LessonsLevelViewController: BaseViewController, Storyboarded {
    
    // MARK: - IBOutlets
    @IBOutlet weak var levelsTableView: UITableView!
    
    // MARK: - let/var
    var viewModel: LessonsLevelViewModelProtocol?

    // MARK: - lifecycle func
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureNavBarTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        configureNavBarTitle()
        navigationController?.tabBarController?.tabBar.isHidden = false
    }

    // MARK: - UI Configuration funcs
    private func configureUI() {
        
        view.backgroundColor = .primary
        
        levelsTableView.layer.cornerRadius = 12
        levelsTableView.clipsToBounds = true
        levelsTableView.rowHeight = UITableView.automaticDimension
        levelsTableView.estimatedRowHeight = 100
        levelsTableView.contentInset = UIEdgeInsets(top: 17, left: 0, bottom: 17, right: 0)
        
        levelsTableView.dataSource = self
        levelsTableView.delegate = self
        
        let nib = UINib(nibName: "ProgressTableViewCell", bundle: nil)
        levelsTableView.register(nib, forCellReuseIdentifier: "ProgressTableViewCell")
        
        //viewModel?.setLevels()
    }

    private func configureNavBarTitle() {

        guard let navBar = navigationController?.navigationBar else { return }

        title = "Lessons"
        navBar.prefersLargeTitles = true

        navBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: AnonymousPro.bold(size: 28).font(),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        
        navBar.titleTextAttributes = [
            NSAttributedString.Key.font: AnonymousPro.bold(size: 28).font(),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]

        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.tintColor = .white
        navBar.barTintColor = .primary
    }
}

// MARK: - Extensions
extension LessonsLevelViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel else { return 0 }
        return viewModel.numberOfRowInSection(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressTableViewCell", for: indexPath) as? ProgressTableViewCell
        
        guard let cell, let viewModel else { return UITableViewCell() }
        
        guard let item = viewModel.cellViewModel(for: indexPath) else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        cell.configureCell(title: item.title)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel else { return }
        guard let item = viewModel.cellViewModel(for: indexPath) else { return }
        print(item)

    }
}

