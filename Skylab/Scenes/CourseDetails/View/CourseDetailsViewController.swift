//
//  CourseDetailsViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 01/06/2023.
//

import UIKit

class CourseDetailsViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var courseDetailsTableView: UITableView!
    @IBOutlet weak var courseDetailsBackgroundView: UIView!
    @IBOutlet weak var courseDetailsScrollView: UIScrollView!
    @IBOutlet weak var courseDetailsViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomCustomView: CustomApplyForCourseView!
    
    var viewModel: CourseDetailsViewModelProtocol?
    
    private let cellId = String(describing: CourseDetailsTableViewHeader.self)
    private var defaultTrlMenuTableViewHeight: CGFloat? = 196.0
    private var defaultScrollViewContentOffsetY: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        defaultScrollViewContentOffsetY = courseDetailsScrollView.contentOffset.y
    }
    
    //MARK: - UI Configurations
    
    private func configureUI() {
        
        self.view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        
        bottomCustomView.configureUI()
        
        courseDetailsTableView.register(UINib(nibName: cellId, bundle: nil),
                                        forHeaderFooterViewReuseIdentifier: cellId)
        courseDetailsTableView.dataSource = self
        courseDetailsTableView.delegate = self
        
        courseDetailsScrollView.backgroundColor = .primary
        courseDetailsScrollView.isScrollEnabled = false
        courseDetailsScrollView.delegate = self
        
        courseDetailsBackgroundView.layer.cornerRadius = 15
        courseDetailsBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // Removes the gap between the headers in the trlMenuTableView
        if #available(iOS 15, *) {
            courseDetailsTableView.sectionHeaderTopPadding = 0
        }
        
        configureNavBarTitle()
    }
    
    private func configureNavBarTitle() {
        
        guard let navBar = navigationController?.navigationBar else { return }
        
        navigationItem.title = "теми курсу"
        
        navBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        
        navBar.tintColor = .white
        navBar.barTintColor = .primary
        navigationItem.backButtonTitle = ""
    }
}

//MARK: - Extensions

//MARK: UITableView Delegate and DataSource

extension CourseDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "TRLMenuTableViewCell", for: indexPath) as? CourseDetailsTableViewCell,
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
            let header = Bundle.main.loadNibNamed(cellId, owner: nil)?.first as? CourseDetailsTableViewHeader,
            let data = viewModel?.tutorialMenuData
        else { return UIView() }
        
        header.configureHeader(title: data[section].title, section: section)
        header.rotateImage(data[section].isExpanded)
        header.delegate = self
        
        // А ssigns a tag to the header
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
        59
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        33
    }
}

//MARK: TRLMenuCustomHeaderDelegate

extension CourseDetailsViewController: CourseDetailsHeaderDelegate {
    
    func expandedSection(button: UIButton) {
        
        let section = button.tag
        
        guard let isExpanded = viewModel?.tutorialMenuData [section].isExpanded else { return }
        viewModel?.tutorialMenuData[section].isExpanded = !isExpanded
        
        self.courseDetailsTableView.reloadSections(IndexSet(integer: section), with: .automatic)
        
        // Checks if all cells are closed
        if defaultTrlMenuTableViewHeight == courseDetailsTableView.contentSize.height {
            
            courseDetailsScrollView.isScrollEnabled = false
            
            // Returns the scrollView to the default position
            courseDetailsScrollView.setContentOffset(CGPoint(x: 0, y: defaultScrollViewContentOffsetY ?? 0), animated: true)
        } else {
            
            courseDetailsScrollView.isScrollEnabled = true
            courseDetailsViewHeightConstraint.constant = courseDetailsTableView.contentSize.height - 300
        }
    }
}

//MARK: UIScrollViewDelegate

extension CourseDetailsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffset = scrollView.contentOffset.y
        
        // When scrolling it hides or shows the navBar
        if contentOffset > defaultScrollViewContentOffsetY ?? 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
}


