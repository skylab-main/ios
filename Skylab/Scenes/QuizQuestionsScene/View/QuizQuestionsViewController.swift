//
//  QuizQuestionsViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 17/06/2023.
//

import UIKit

class QuizQuestionsViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var numberOfQuestionsLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerViewsCollection: [DoubleBorderForView]!
    @IBOutlet var answerButtonsCollection: [UIButton]!
    @IBOutlet weak var questionBackgroundView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    
    var viewModel: QuizQuestionsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNavBarTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel?.getQuiz()
        updateUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel?.setToDefault()
    }
    
    deinit {
        print("DEINIT QuizQuestionsViewController")
    }

    //MARK: - UI Configurations
    
    private func configureUI() {
        
        self.view.backgroundColor = .primary
        
        numberOfQuestionsLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 14, textColor: .primary, nil)
        
        continueButton.configureButton(title: "Продовжити",
                                       imageName: "rightArrow",
                                       fontName: CustomFonts.anonymousProBold.rawValue,
                                       fontSize: 14,
                                       tintColor: .primary)
        
        viewModel?.getQuiz()
        configureQuestionLabel()
        configureProgressBar()
        configureQuestionBackgroundView()
    }
    
    private func configureQuestionLabel() {
        
        questionLabel.numberOfLines = 0
        questionLabel.adjustsFontSizeToFitWidth = true
        questionLabel.minimumScaleFactor = 0.5
        questionLabel.textColor = .primary
        questionLabel.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont(name: CustomFonts.anonymousProBold.rawValue, size: 28) ?? UIFont.systemFont(ofSize: 20))
    }
    
    private func configureProgressBar() {
        
        guard let viewModel else { return }
        
        progressBar.progressTintColor = .white
        progressBar.trackTintColor = UIColor(white: 1, alpha: 0.2)
        progressBar.progress = viewModel.getQuizProgress()
    }
    
    private func configureQuestionBackgroundView() {
        
        questionBackgroundView.backgroundColor = .white
        questionBackgroundView.layer.configureViewLayer(cornerRadius: 12, borderWidth: nil, borderColor: nil, nil)
        questionBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func configureNavBarTitle() {
            
        guard let viewModel, let navBar = navigationController?.navigationBar else { return }
        
        navigationController?.tabBarController?.tabBar.isHidden = true
        
        title = viewModel.getQuizTopicTitle()
        
        navBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro-Bold", size: 20) ?? UIFont.systemFont(ofSize: 28),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]

        let backButtonImage = UIImage(named: "backArrow")
        navBar.backIndicatorImage = backButtonImage
        navBar.backIndicatorTransitionMaskImage = backButtonImage
        navBar.topItem?.backButtonDisplayMode = .minimal
    }
    
    private func updateUI() {
        
        guard let viewModel else { return }
        
        numberOfQuestionsLabel.text = "\(String(viewModel.currentQuestionNumber())) of \(viewModel.getNumberOfQuestions())"
        questionLabel.text = viewModel.getQuestionText()
        
        answerButtonsCollection.forEach { button in
            
            let answer = viewModel.getAnswers()
        
            button.titleLabel?.font = UIFont(name: CustomFonts.anonymousProBold.rawValue, size: 14)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            button.tintColor = .primary
            button.backgroundColor = .clear
            button.layer.cornerRadius = 12
            button.isEnabled = true
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.titleLabel?.minimumScaleFactor = 0.5
            button.titleLabel?.numberOfLines = 0
            button.setTitleColor(.primary, for: .disabled)
            
            switch button.tag {
            case 0:
                button.setTitle("a) " + "\(answer[0])", for: .normal)
            case 1:
                button.setTitle("b) " + "\(answer[1])", for: .normal)
            case 2:
                button.setTitle("c) " + "\(answer[2])", for: .normal)
            case 3:
                button.setTitle("d) " + "\(answer[3])", for: .normal)
            default: return
            }
        }
        
    }
    
    //MARK: - IBActions
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        
        guard let viewModel else { return print("The ViewModel doesn't exist!") }
        
        let userAnswer = sender.tag
        let userGotItRight = viewModel.checkCorrectAnswer(userAnswer) 
        
        if userGotItRight {
            
            sender.backgroundColor = .success
            
            answerButtonsCollection.forEach { button in
                button.isEnabled = false
            }
        } else {
            
            sender.backgroundColor = .error
        }
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        
        guard let viewModel else { return print("The ViewModel doesn't exist!") }
        
        viewModel.nextQuestion()
        updateUI()
    }
    
}
