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
    
    private func configureUI() {
        
        tutorialTableView.dataSource = self
    }
    
}

extension TutorialViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TutorialTableViewCell", for: indexPath) as? TutorialTableViewCell else { return UITableViewCell() }
        
        cell.updateCell(data: viewModel?.data[indexPath.row] ?? "No data")
        
        return cell
    }
}
