//
//  LessonsViewController.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit

class LessonsViewController: BaseViewController, Storyboarded {
    
    // MARK: - IBOutlets
    @IBOutlet weak var lessonsTableView: UITableView!
    @IBOutlet weak var descriptionCourseButton: UIButton!
    
    // MARK: - let/var
    var viewModel: LessonsViewModelProtocol?

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
        
        lessonsTableView.layer.cornerRadius = 12
        lessonsTableView.clipsToBounds = true
        lessonsTableView.rowHeight = UITableView.automaticDimension
        lessonsTableView.estimatedRowHeight = 100
        lessonsTableView.contentInset = UIEdgeInsets(top: 17, left: 0, bottom: 17, right: 0)

        descriptionCourseButton.configureButton(title: NSLocalizedString("LessonsViewController.descriptionCourseButton.title",
                                                                         comment: "title of the button describing the full course on the lessons screen"),
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

        title = NSLocalizedString("LessonsViewController.title",
                                  comment: "title for lessons screen")
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
extension LessonsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel else { return 0 }
        return viewModel.numberOfRowInSection(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressTableViewCell", for: indexPath) as? ProgressTableViewCell
        
        guard let cell, let viewModel else { return UITableViewCell() }
        
        guard let item = viewModel.cellViewModel(for: indexPath) else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        cell.configureCell(title: item.title, progress: item.progressPercent)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard
            let goToLessonsLevel = viewModel?.openLessonsLevelController,
            let item = viewModel?.cellViewModel(for: indexPath)
        else { return }
        
        goToLessonsLevel.onNext(item)
    }
}
