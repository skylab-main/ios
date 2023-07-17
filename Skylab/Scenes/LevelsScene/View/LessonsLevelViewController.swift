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
    }

    // MARK: - UI Configuration funcs
    private func configureUI() {
        
        view.backgroundColor = .primary
        
        levelsTableView.layer.cornerRadius = 12
        levelsTableView.clipsToBounds = true
        levelsTableView.rowHeight = UITableView.automaticDimension
        levelsTableView.estimatedRowHeight = 100
        levelsTableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        levelsTableView.dataSource = self
        levelsTableView.delegate = self
        
        let nib = UINib(nibName: "ProgressTableViewCell", bundle: nil)
        levelsTableView.register(nib, forCellReuseIdentifier: "ProgressTableViewCell")
        
        navigationController?.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }

    private func configureNavBarTitle() {

        guard let navBar = navigationController?.navigationBar else { return }
        
        // Створення мітки
        let label = UILabel()
        label.text = viewModel?.titleText()
        label.textColor = .white
        label.textAlignment = .center
        label.font = AnonymousPro.bold(size: 20).font()

        // Налаштування розміру мітки
        let labelSize = label.intrinsicContentSize
        label.frame = CGRect(x: 0, y: 0, width: labelSize.width, height: labelSize.height)

        // Центрування мітки у navigationBar
        let titleLabel = UIView(frame: CGRect(x: 0, y: 0, width: labelSize.width, height: labelSize.height))
        titleLabel.addSubview(label)
        titleLabel.center = navBar.center
        navigationItem.titleView = titleLabel
        
        let backButtonImage = UIImage(named: "backArrow")
        navBar.backIndicatorImage = backButtonImage
        navBar.backIndicatorTransitionMaskImage = backButtonImage
        navBar.topItem?.backButtonDisplayMode = .minimal
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

        guard
            let goToLessonsVideo = viewModel?.openLessonsVideoController,
            let item = viewModel?.cellViewModel(for: indexPath)
        else { return }
        
        goToLessonsVideo.onNext(item)
    }
}

