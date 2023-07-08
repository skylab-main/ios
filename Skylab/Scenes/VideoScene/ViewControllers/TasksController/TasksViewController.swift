//
//  TasksViewController.swift
//  Skylab
//
//  Created by Сергей Молодец on 06.07.2023.
//

import UIKit

class TasksViewController: UIViewController, Storyboarded {
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var codeView: UITextView!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var markButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
