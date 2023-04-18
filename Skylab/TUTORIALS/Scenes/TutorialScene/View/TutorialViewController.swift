//
//  TutorialViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 10/04/2023.
//

import UIKit

class TutorialViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var tutorialTableView: UITableView!
    
    var viewModel: TutorialViewModelProtocol?
    
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

        tutorialTableView.dataSource = self
        tutorialTableView.delegate = self
    }
    
    private func configureNavBarTitle() {
        
        guard let navBar = navigationController?.navigationBar else { return }
        
        navigationItem.title = "Tutorials"
        
        navBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.black,
        ]
        
        navBar.tintColor = .black
        navigationItem.backButtonTitle = ""
    }
    
}

//MARK: - Extensions

extension TutorialViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.topicsArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TutorialTableViewCell", for: indexPath) as? TutorialTableViewCell else { return UITableViewCell() }
        
        cell.updateCell(data: viewModel?.topicsArray[indexPath.row] ?? "No data")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = viewModel?.topicsArray[indexPath.row]
        
        viewModel?.openChatGPTViewController(item ?? "")
        
    }
}
