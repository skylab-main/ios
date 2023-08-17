//
//  VideoViewController.swift
//  Skylab
//
//  Created by Сергей Молодец on 05.07.2023.
//

import UIKit

class VideoViewController: BaseViewController, Storyboarded {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tabSwitcherView: ScrollableMenuView! {
        didSet {
            tabSwitcherView.delegate = self
        }
    }
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - let/var
    var lessonsVC: LessonsVideoViewController!
    var tasksVC: TasksViewController!
    
    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupContainer()
    }
    
    // MARK: - UI Configurations funcs
    private func configureUI() {
        self.view.backgroundColor = .primary
        tabSwitcherView.items = [ NSLocalizedString("VideoViewController.tabSwitcherView.items.lesson",
                                                    comment: "lesson title of tabSwitcherView on the video screen"),
            NSLocalizedString("VideoViewController.tabSwitcherView.items.task",
                                                    comment: "task title of tabSwitcherView on the video screen")]
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 12
        containerView.clipsToBounds = true
        navigationController?.navigationBar.primaryStyle()
    }
    
    private func setupContainer() {
        addChild(tasksVC)
        addChild(lessonsVC)
        containerView.addSubview(tasksVC.view)
        containerView.addSubview(lessonsVC.view)
        
        tasksVC.didMove(toParent: self)
        lessonsVC.didMove(toParent: self)
        
        tasksVC.view.frame = containerView.bounds
        lessonsVC.view.frame = containerView.bounds
    }
}

// MARK: - Extensions
extension VideoViewController: ScrollableMenuViewDelegate {
    func getIndex(_ index: Int) {
        tasksVC.view.isHidden = true
        lessonsVC.view.isHidden = true
        switch index {
        case 0: lessonsVC.view.isHidden = false
        case 1: tasksVC.view.isHidden = false
        default: debugPrint("error scrolableView")
        }
    }
}
