//
//  TRLMenuComponentViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 21/04/2023.
//

import UIKit

class TRLMenuComponentViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var trlMenuTableView: UITableView!
    @IBOutlet weak var trlMenuBackgroundView: UIView!
    @IBOutlet weak var applyForACourseView: UIView!
    @IBOutlet weak var applyForACourseButton: UIButton!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var trlMenuViewHeightConstraint: NSLayoutConstraint!
    
    var viewModel: TRLMenuViewModelProtocol? = TRLMenuViewModel()
    
    private let cellId = String(describing: TRLMenuCustomTableViewHeader.self)
    private var defaulttrlMenuTableViewHeight: CGFloat = 196
    private var defaultBgMenuHeight: CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureNavBarTitle()
        
        myScrollView.isScrollEnabled = false
    }

    //MARK: - UI Configurations
    
    private func configureUI() {
        
        self.view.backgroundColor = .primary
        
        trlMenuTableView.register(UINib(nibName: cellId, bundle: nil),
                                       forHeaderFooterViewReuseIdentifier: cellId)
        trlMenuTableView.dataSource = self
        trlMenuTableView.delegate = self
        
        trlMenuBackgroundView.layer.cornerRadius = 15
        trlMenuBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        applyForACourseButton.titleLabel?.font = UIFont(name: "AnonymousPro-Bold", size: 14)
        applyForACourseButton.tintColor = .primary
        applyForACourseButton.setTitle("подати заявку на курс" + " \u{2192}", for: .normal)
        
        applyForACourseView.addBorders(edges: [.top], color: .systemGray4)
        
        if #available(iOS 15, *) {
            trlMenuTableView.sectionHeaderTopPadding = 0
        }
    }
    
    private func configureNavBarTitle() {
        
        guard let navBar = navigationController?.navigationBar else { return }
        
        navigationItem.title = "теми курсу"
        
        navBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        
        navBar.tintColor = .white
        navigationItem.backButtonTitle = ""
    }
    
}

//MARK: - Extensions

//MARK: UITableView Delegate and DataSource

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
        
        // Get the total number of sections and rows in the table view
        let numSections = tableView.numberOfSections
        let numRowsInSection = tableView.numberOfRows(inSection: indexPath.section)

        cell.configureCell()
        
        // Check if this is the last cell in the last section
            if indexPath.section == numSections - 1 && indexPath.row == numRowsInSection - 1 {
                
                cell.isThisLastCellInLastSection(true)
              
            } else {
                // If this is not the last cell in the last section
                
                cell.isThisLastCellInLastSection(false)
            }
        
        cell.textLabel?.font = UIFont(name: "AnonymousPro-Bold", size: 14)
        cell.textLabel?.textColor = .primary
        cell.textLabel?.text = "• " + data[indexPath.section].data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard
            let header = Bundle.main.loadNibNamed(cellId, owner: nil)?.first as? TRLMenuCustomTableViewHeader,
            let data = viewModel?.tutorialMenuData
        else { return UIView() }
        
        header.configureHeader(title: data[section].title, section: section)
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
}

//MARK: TRLMenuCustomHeaderDelegate

extension TRLMenuComponentViewController: TRLMenuCustomHeaderDelegate {
    
    func expandedSection(button: UIButton) {
        
        let section = button.tag
        
        guard let isExpanded = viewModel?.tutorialMenuData [section].isExpanded else { return }
        viewModel?.tutorialMenuData[section].isExpanded = !isExpanded
        
        self.trlMenuTableView.reloadSections(IndexSet(integer: section), with: .automatic)
        
        if defaulttrlMenuTableViewHeight == trlMenuTableView.contentSize.height {
            
            //myScrollView.isScrollEnabled = false
            navigationController?.hidesBarsOnSwipe = false
            
            // Assume scrollView is the UIScrollView instance that you want to reset
            myScrollView.setContentOffset(CGPoint.zero, animated: true)
            
            // Reset the content size of the scroll view
            myScrollView.contentSize = CGSize(width: myScrollView.frame.width, height: 0.0)
            
        } else {
            myScrollView.isScrollEnabled = true
            //navigationController?.hidesBarsOnSwipe = true
            trlMenuViewHeightConstraint.constant = trlMenuTableView.contentSize.height - 300
            
        }
    }
}

