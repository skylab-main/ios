//
//  QuizQuestionsViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 17/06/2023.
//

import UIKit

class QuizQuestionsViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var quizTopicLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var numberOfQuestionsLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerVIewsCollection: [DoubleBorderForView]!
    @IBOutlet var answerButtonsCollection: [UIButton]!
    
    var viewModel = QuizQuestionsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        
        progressBar.progress = 0.0
        
        quizTopicLabel.text = viewModel.quizData?.topic
        progressBar.progress = (viewModel.quizData?.progress ?? 0.0) / 100
    }


}
