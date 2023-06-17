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
    @IBOutlet var answerViewsCollection: [DoubleBorderForView]!
    @IBOutlet var answerButtonsCollection: [UIButton]!
    @IBOutlet weak var questionBackgroundView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    
    var viewModel = QuizQuestionsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNavBarTitle()
    }
    
    private func configureUI() {
        
        self.view.backgroundColor = .primary
        questionBackgroundView.backgroundColor = .white
        
        navigationController?.tabBarController?.tabBar.isHidden = true
        
        questionBackgroundView.layer.configureViewLayer(cornerRadius: 12, borderWidth: nil, borderColor: nil, nil)
        questionBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        quizTopicLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 20, textColor: .white, nil)
        quizTopicLabel.text = viewModel.quizData?.topic
        
        numberOfQuestionsLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 12, textColor: .primary, nil)
        
        questionLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 28, textColor: .primary, nil)
        questionLabel.text = "What is a separate Swift command usually called?"
        
        progressBar.progressTintColor = .white
        progressBar.trackTintColor = .systemGray2
        progressBar.progress = (viewModel.quizData?.progress ?? 0.0) / 100
        
        continueButton.configureButton(title: "Продовжити",
                                       imageName: "rightArrow",
                                       fontName: CustomFonts.anonymousProBold.rawValue,
                                       fontSize: 14,
                                       tintColor: .primary)
        
        answerButtonsCollection.forEach { button in
            
            button.titleLabel?.font = UIFont(name: CustomFonts.anonymousProBold.rawValue, size: 14)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            button.tintColor = .primary
            
            switch button.tag {
            case 0:
                button.setTitle("a) " + "Statement", for: .normal)
            case 1:
                button.setTitle("b) " + "Nament", for: .normal)
            case 2:
                button.setTitle("c) " + "Kament", for: .normal)
            case 3:
                button.setTitle("d) " + "Atement", for: .normal)
            default: return
            }
        }
    }

    private func configureNavBarTitle() {
            
        guard let navBar = navigationController?.navigationBar else { return }
        
        navBar.prefersLargeTitles = false

        let backButtonImage = UIImage(named: "backArrow")
        navBar.backIndicatorImage = backButtonImage
        navBar.backIndicatorTransitionMaskImage = backButtonImage
        navBar.topItem?.backButtonDisplayMode = .minimal
    }

}
