//
//  TRLMenuComponentViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 21/04/2023.
//

import UIKit

class TRLMenuComponentViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var tutorialMenuTableView: UITableView!
    
    var viewModel: TRLMenuViewModelProtocol? = TRLMenuViewModel()
    private let cellId = String(describing: TRLMenuCustomCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    private func configureUI() {

        tutorialMenuTableView.register(UINib(nibName: cellId, bundle: nil),
                                       forCellReuseIdentifier: "TRLMenuCell")
        tutorialMenuTableView.dataSource = self
        tutorialMenuTableView.delegate = self
    }
    
}

extension TRLMenuComponentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.tutorialMenuData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = viewModel?.tutorialMenuData[section] else { return 0 }
        
        if section.isExpanded {
            return section.data.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "TRLMenuCell", for: indexPath) as? TRLMenuCustomCell,
            let data = viewModel?.tutorialMenuData
        else { return UITableViewCell() }
        
        if indexPath.row == 0 {
            cell.configureCell(title: data[indexPath.section].title)
        } else {
            cell.configureCell(title: "*" + data[indexPath.section].data[indexPath.row - 1])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        viewModel!.tutorialMenuData[indexPath.section].isExpanded = !viewModel!.tutorialMenuData[indexPath.section].isExpanded
        
        tableView.reloadSections([indexPath.section], with: .none)
    }
 
    
}



