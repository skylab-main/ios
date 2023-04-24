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
    private let cellId = String(describing: TRLMenuCustomTableViewCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    private func configureUI() {
        
        self.view.backgroundColor = .primary

        tutorialMenuTableView.register(UINib(nibName: cellId, bundle: nil),
                                       forHeaderFooterViewReuseIdentifier: cellId)
        tutorialMenuTableView.dataSource = self
        tutorialMenuTableView.delegate = self
        
        if #available(iOS 15, *) {
            tutorialMenuTableView.sectionHeaderTopPadding = 0
        }
    }
    
}

extension TRLMenuComponentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.tutorialMenuData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = viewModel?.tutorialMenuData[section] else { return 0 }
        
        if !section.isExpanded {
            return 0
        }
        
        return section.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TRLMenuTableViewCell", for: indexPath)
        
        guard let data = viewModel?.tutorialMenuData else { return UITableViewCell() }
        
        cell.textLabel?.text = data[indexPath.section].data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard
            let header = Bundle.main.loadNibNamed(cellId, owner: nil)?.first as? TRLMenuCustomTableViewCell,
            let data = viewModel?.tutorialMenuData
        else { return UIView() }
        
        header.configure(title: data[section].title, section: section)
        header.rotateImage(data[section].isExpanded)
        header.delegate = self
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .zero
    }
}

extension TRLMenuComponentViewController: TRLMenuCustomCellDelegate {
    
    func expandedSection(button: UIButton) {
        
        let section = button.tag
        
        let isExpanded = viewModel?.tutorialMenuData [section].isExpanded
        viewModel?.tutorialMenuData[section].isExpanded = !isExpanded!
        
        tutorialMenuTableView.reloadSections(IndexSet(integer: section), with: .fade)
    }
}


