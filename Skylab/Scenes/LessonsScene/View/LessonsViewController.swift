//
//  LessonsViewController.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit

class LessonsViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var lessonsTableView: UITableView!
    @IBOutlet weak var descriptionCurseButton: UIButton!
    
    var viewModel: LessonsViewModelProtocol?

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

    //MARK: - UI Configuration

    private func configureUI() {

        view.backgroundColor = .primary
        
        lessonsTableView.layer.cornerRadius = 12
        lessonsTableView.clipsToBounds = true
        lessonsTableView.rowHeight = UITableView.automaticDimension
        lessonsTableView.estimatedRowHeight = 100
        lessonsTableView.contentInset = UIEdgeInsets(top: 17, left: 0, bottom: 0, right: 0)

        descriptionCurseButton.configureButton(title: "Опис повного курсу",
                                               imageName: "rightArrow",
                                               fontName: "AnonymousPro-Bold",
                                               fontSize: 14,
                                               tintColor: .primary)
        
        lessonsTableView.dataSource = self
        lessonsTableView.delegate = self
       
        let nib = UINib(nibName: "ProgressTableViewCell", bundle: nil)
        lessonsTableView.register(nib, forCellReuseIdentifier: "ProgressTableViewCell")
        
        viewModel?.getLessons()
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

extension LessonsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel else { return 0 }
        return viewModel.numberOfRowInSection(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressTableViewCell", for: indexPath) as? ProgressTableViewCell
        
        guard let cell, let viewModel else { return UITableViewCell() }
        
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel else { return }
        guard let item = viewModel.viewModelForSelectedRow() else { return }
        print(item)

    }
}
