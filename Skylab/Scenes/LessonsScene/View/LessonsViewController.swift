//
//  LessonsViewController.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit

class LessonsViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var lessonsTableView: UITableView!
    
    var viewModel: LessonsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
            configureNavBarTitle()
    }
    
    //MARK: - UI Configuration
    
    private func configureUI() {

        view.backgroundColor = .primary
        
        lessonsTableView.layer.cornerRadius = 15
        lessonsTableView.clipsToBounds = true
        lessonsTableView.rowHeight = UITableView.automaticDimension
        lessonsTableView.estimatedRowHeight = 100
        
        lessonsTableView.dataSource = self
        lessonsTableView.delegate = self
    }

    private func configureNavBarTitle() {
        
        guard let navBar = navigationController?.navigationBar else { return }
        
        navigationItem.title = "Lessons"
        navBar.prefersLargeTitles = true
        
        navBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro", size: 28) ?? UIFont.systemFont(ofSize: 28),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        
        navBar.tintColor = .primary
    }
}

//MARK: - Extensions

extension LessonsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.lessonsArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LessonTableViewCell", for: indexPath) as? LessonTableViewCell else { return UITableViewCell() }
        
        let title = viewModel?.lessonsArray[indexPath.row].0 ?? "No data"
        let progressValues = viewModel?.lessonsArray[indexPath.row].1 ?? 0
        cell.updateCell(title: title, progressValues: progressValues)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = viewModel?.lessonsArray[indexPath.row].0 ?? "No data"
        
        viewModel?.openLevelViewController(item)
        
    }
}
