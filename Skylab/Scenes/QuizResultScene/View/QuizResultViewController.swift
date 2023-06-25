//
//  QuizResultViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 25/06/2023.
//

import UIKit

class QuizResultViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var congratsLabel: UILabel!
    @IBOutlet weak var numberOfCorrectAnswersLabel: UILabel!
    @IBOutlet weak var percentageResultView: DoubleBorderForView!
    @IBOutlet weak var percentageResultLabel: UILabel!
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var allQuizzesButton: UIButton!
    @IBOutlet weak var nextQuizButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    


}
