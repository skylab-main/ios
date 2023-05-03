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
        tutorialMenuTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
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
        
        cell.cellMainView.backgroundColor = .white
        cell.cellMainView.addBorders(edges: [.right, .left], color: .primary)
        
        cell.doubleBorderView.backgroundColor = .clear
        cell.doubleBorderView.layer.borderColor = UIColor.primary.cgColor
        cell.doubleBorderView.addBorders(edges: [.right], color: .primary)
        
        // Check if this is the last row
        if indexPath.row == numRowsInSection - 1 {
            
            cell.cellMainViewBottomConstraint.constant = 3
            
            // Check if this is the last row in the last section
            if indexPath.section == tableView.numberOfSections - 1 {
                
                // Round bottom corners of cell
                cell.cellMainView.layer.cornerRadius = 15
                cell.cellMainView.layoutIfNeeded()
                cell.cellMainView.layer.addBorder(side: .bottom, thickness: 1,
                                                     color: UIColor.primary.cgColor,
                                                     maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
                cell.cellMainView.layer.masksToBounds = true
                cell.cellMainView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
   
                cell.doubleBorderView.layer.borderWidth = 0
                cell.doubleBorderView.layer.cornerRadius = 15
                cell.doubleBorderView.layoutIfNeeded()
                cell.doubleBorderView.layer.addBorder(side: .right, thickness: 1, color: UIColor.primary.cgColor)
                cell.doubleBorderView.layer.addBorder(side: .bottom, thickness: 1, color: UIColor.primary.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
                cell.doubleBorderView.layer.masksToBounds = true
                cell.doubleBorderView.layer.maskedCorners = [.layerMaxXMaxYCorner]
            }
            
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
}

extension TRLMenuComponentViewController: TRLMenuCustomHeaderDelegate {
    
    func expandedSection(button: UIButton) {
        
        let section = button.tag
        
        let isExpanded = viewModel?.tutorialMenuData [section].isExpanded
        viewModel?.tutorialMenuData[section].isExpanded = !isExpanded!
        
        self.tutorialMenuTableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
}


