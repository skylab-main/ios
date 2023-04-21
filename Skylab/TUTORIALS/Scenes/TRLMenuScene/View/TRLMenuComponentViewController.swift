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

        tutorialMenuTableView.dataSource = self
        tutorialMenuTableView.delegate = self
        tutorialMenuTableView.register(UINib(nibName: cellId, bundle: nil),
                                       forHeaderFooterViewReuseIdentifier: cellId)
        tutorialMenuTableView.tableFooterView = UIView()
    }
    
}

extension TRLMenuComponentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.tutorialMenuData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !(viewModel?.tutorialMenuData[section].isExpanded ?? true) {
            return 0
        }
        
        return viewModel?.tutorialMenuData[section].data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TRLMenuTableViewCell", for: indexPath)
        cell.textLabel?.text = viewModel?.tutorialMenuData[indexPath.section].data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: cellId) as? TRLMenuCustomCell else { return UIView() }
        
        header.configure(title: viewModel?.tutorialMenuData[section].title ?? "Error", section: section)
        header.delegate = self
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
}

extension TRLMenuComponentViewController: TRLMenuCustomCellDelegate {
    
    func expandedSection(button: UIButton) {
        
        let section = button.tag
        
        let isExpanded = viewModel?.tutorialMenuData[section].isExpanded
        viewModel?.tutorialMenuData[section].isExpanded = !isExpanded!
        
        tutorialMenuTableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
    
}
