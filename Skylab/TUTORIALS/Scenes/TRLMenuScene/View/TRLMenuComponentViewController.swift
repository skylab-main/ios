//
//  TRLMenuComponentViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 21/04/2023.
//

import UIKit

class TRLMenuComponentViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var tutorialMenuTableView: UITableView!
    @IBOutlet weak var trlMenuBackgroundView: UIView!
    @IBOutlet weak var applyForACourseView: UIView!
    @IBOutlet weak var applyForACourseButton: UIButton!
    
    var viewModel: TRLMenuViewModelProtocol? = TRLMenuViewModel()
    
    private let cellId = String(describing: TRLMenuCustomTableViewHeader.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureNavBarTitle()
    }
    
    private func configureUI() {
        
        self.view.backgroundColor = .primary
        
        tutorialMenuTableView.register(UINib(nibName: cellId, bundle: nil),
                                       forHeaderFooterViewReuseIdentifier: cellId)
        tutorialMenuTableView.dataSource = self
        tutorialMenuTableView.delegate = self
        
        trlMenuBackgroundView.layer.cornerRadius = 15
        trlMenuBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        applyForACourseButton.titleLabel?.font = UIFont(name: "AnonymousPro-Bold", size: 14)
        applyForACourseButton.tintColor = .primary
        applyForACourseButton.setTitle("подати заявку на курс" + " \u{2192}", for: .normal)
        
        applyForACourseView.addBorders(edges: [.top], color: .systemGray4)
        
        if #available(iOS 15, *) {
            tutorialMenuTableView.sectionHeaderTopPadding = 0
        }
    }
    
    private func configureNavBarTitle() {
        
        guard let navBar = navigationController?.navigationBar else { return }
        
        navigationItem.title = "теми курсу"
        navBar.prefersLargeTitles = true
        
        navBar.isTranslucent = true
        
        navBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        
        navBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        
        navBar.tintColor = .white
        navigationItem.backButtonTitle = ""
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
        
        let numRowsInSection = tableView.numberOfRows(inSection: indexPath.section)
    

        let rightBorder = CALayer()
        rightBorder.frame = CGRect(x: cell.frame.size.width - 1, y: 0, width: 1, height: cell.frame.size.height)
        rightBorder.backgroundColor = UIColor.primary.cgColor
        cell.layer.addSublayer(rightBorder)
        
        cell.cellBackgroundView.backgroundColor = .white
        cell.cellBackgroundView.addBorders(edges: [.right, .left], color: .primary)
        cell.cellBackgroundViewBottomConstraint.constant = 0
        
        cell.secondCellBackgroundView.backgroundColor = .white
        cell.secondCellBackgroundView.layer.borderWidth = 1
        cell.secondCellBackgroundView.layer.borderColor = UIColor.primary.cgColor
        cell.secondCellBackgroundView.layer.cornerRadius = 15
        cell.secondCellBackgroundView.layer.masksToBounds = true
        
        cell.doubleBorderView.backgroundColor = .clear
        cell.doubleBorderView.layer.borderWidth = 1
        cell.doubleBorderView.layer.borderColor = UIColor.primary.cgColor
        cell.doubleBorderView.isHidden = true
        
        // Check if this is the last row
        if indexPath.row == numRowsInSection - 1 {
            // Add bottom border to cell
            cell.cellBackgroundView.addBorders(edges: [.bottom], color: .primary)
            
            if indexPath.section == tableView.numberOfSections - 1 {
                // Round bottom corners of cell
                cell.cellBackgroundView.layer.cornerRadius = 15
                cell.cellBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
                cell.cellBackgroundView.clipsToBounds = true
                cell.cellBackgroundViewBottomConstraint.constant = 5
                cell.secondCellViewBottomConstraint.constant = 4.4
                
                cell.doubleBorderView.layer.cornerRadius = 15
                cell.doubleBorderView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
                
                cell.doubleBorderView.isHidden = false
            
                cell.layer.cornerRadius = 15
                cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            }
            
        } else {
            // If this is not the last row, remove any previously added bottom border
            cell.cellBackgroundView.layer.sublayers?.forEach {
                if $0.frame.size.height == 1 && $0.frame.origin.y == cell.frame.size.height - 1 {
                    $0.removeFromSuperlayer()
                }
            }
            
            // Reset corner radius and masked corners
            cell.cellBackgroundView.layer.cornerRadius = 0
            cell.cellBackgroundView.layer.maskedCorners = []
            cell.cellBackgroundView.clipsToBounds = false
        }
        
        cell.textLabel?.font = UIFont(name: "AnonymousPro-Bold", size: 14)
        cell.textLabel?.textColor = .primary
        cell.textLabel?.text = "• " + data[indexPath.section].data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
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
    f
}

extension TRLMenuComponentViewController: TRLMenuCustomHeaderDelegate {
    
    func expandedSection(button: UIButton) {
        
        let section = button.tag
        
        let isExpanded = viewModel?.tutorialMenuData [section].isExpanded
        viewModel?.tutorialMenuData[section].isExpanded = !isExpanded!
        
        self.tutorialMenuTableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
}


