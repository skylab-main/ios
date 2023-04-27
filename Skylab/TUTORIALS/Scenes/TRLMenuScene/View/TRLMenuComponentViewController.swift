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
    
    private let cellId = String(describing: TRLMenuCustomTableViewHeader.self)
    
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
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "TRLMenuTableViewCell", for: indexPath) as? TRLMenuTableViewCell,
            let data = viewModel?.tutorialMenuData
        else { return UITableViewCell() }
        
        cell.cellBackgroundView.backgroundColor = .clear
        cell.cellBackgroundView.addBorders(edges: [.right], color: .primary)
        
        cell.textLabel?.text = "• " + data[indexPath.section].data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard
            let header = Bundle.main.loadNibNamed(cellId, owner: nil)?.first as? TRLMenuCustomTableViewHeader,
            let data = viewModel?.tutorialMenuData
        else { return UIView() }
        
        header.configure(title: data[section].title, section: section)
        header.rotateImage(data[section].isExpanded)
        header.delegate = self
        
        if section == 0 {
            header.tag = 1
        } else if section == tableView.numberOfSections - 1 {
            header.tag = 2
        } else {
            header.tag = 0
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let numRowsInSection = tableView.numberOfRows(inSection: indexPath.section)
        
        // Add left and right borders to cell
        let leftBorder = CALayer()
        leftBorder.frame = CGRect(x: 0, y: 0, width: 1, height: cell.frame.size.height)
        leftBorder.backgroundColor = UIColor.primary.cgColor
        cell.layer.addSublayer(leftBorder)
        
        let rightBorder = CALayer()
        rightBorder.frame = CGRect(x: cell.frame.size.width - 1, y: 0, width: 1, height: cell.frame.size.height)
        rightBorder.backgroundColor = UIColor.primary.cgColor
        cell.layer.addSublayer(rightBorder)
        
        // Check if this is the last row
        if indexPath.row == numRowsInSection - 1 {
            // Add bottom border to cell
            let bottomBorder = CALayer()
            bottomBorder.frame = CGRect(x: 0, y: cell.frame.size.height - 1, width: cell.frame.size.width, height: 1)
            bottomBorder.backgroundColor = UIColor.primary.cgColor
            cell.layer.addSublayer(bottomBorder)
            
            if indexPath.section == tableView.numberOfSections - 1 {
                // Round bottom corners of cell
                cell.layer.cornerRadius = 15
                cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
                cell.clipsToBounds = true
            }
            
        } else {
            // If this is not the last row, remove any previously added bottom border
            cell.layer.sublayers?.forEach {
                if $0.frame.size.height == 1 && $0.frame.origin.y == cell.frame.size.height - 1 {
                    $0.removeFromSuperlayer()
                }
            }
            
            // Reset corner radius and masked corners
            cell.layer.cornerRadius = 0
            cell.layer.maskedCorners = []
            cell.clipsToBounds = false
        }
    }
}

extension TRLMenuComponentViewController: TRLMenuCustomHeaderDelegate {
    
    func expandedSection(button: UIButton) {
        
        let section = button.tag
        
        let isExpanded = viewModel?.tutorialMenuData [section].isExpanded
        viewModel?.tutorialMenuData[section].isExpanded = !isExpanded!
        
        self.tutorialMenuTableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
}


