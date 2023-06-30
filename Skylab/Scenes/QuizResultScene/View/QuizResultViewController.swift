//
//  QuizResultViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 25/06/2023.
//

import UIKit
import RxSwift
import RxCocoa

class QuizResultViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var mainBackgroundView: UIView!
    @IBOutlet weak var congratsLabel: UILabel!
    @IBOutlet weak var numberOfCorrectAnswersLabel: UILabel!
    @IBOutlet weak var percentageResultBackgroundView: UIView!
    @IBOutlet weak var percentageResultView: DoubleBorderForView!
    @IBOutlet weak var percentageResultLabel: UILabel!
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var allQuizzesButton: UIButton!
    @IBOutlet weak var nextQuizButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var viewModel: QuizResultViewModelProtocol? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        bindButtons()
    }
    
    deinit {
        print("DEINIT QuizResultViewController")
    }
    
    //MARK: - UI Configurations
    
    private func configureUI() {
        
        self.view.backgroundColor = .primary
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        title = viewModel?.getTopicTitle()
        
        mainBackgroundView.backgroundColor = .white
        mainBackgroundView.layer.configureViewLayer(cornerRadius: 12, borderWidth: nil, borderColor: nil, nil)
        mainBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        configureLabels()
        configurePercentageView()
        configureButtons()
        configureProgressBar()
    }
    
    private func configureLabels() {
        
        guard let viewModel else { return }
        
        let correctAnswers = viewModel.getNumberOfCorrectAnswers()
        let numberOfQuestions = viewModel.getNumberOfQuestions()
        
        congratsLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 28, textColor: .primary, nil)
        congratsLabel.text = "Congrats!"
        
        numberOfCorrectAnswersLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 14, textColor: .primary, nil)
        numberOfCorrectAnswersLabel.text = "You’ve answered \(correctAnswers) of \(numberOfQuestions) questions."
        
    }
    
    private func configurePercentageView() {
        
        guard let viewModel else { return }
        
        percentageResultBackgroundView.backgroundColor = .white
        
        percentageResultView.backgroundColor = .primary
        percentageResultView.bottomViewBackgroundColor = .white
        percentageResultView.cornerRadius = percentageResultView.frame.height / 2
        
        percentageResultLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 50, textColor: .white, nil)
        percentageResultLabel.textAlignment = .center
        percentageResultLabel.text = String(viewModel.getPercentageOfCorrectAnswers()) + "%"
        
    }
    
    private func configureButtons() {
        
        repeatButton.configureButton(title: "Повторити",
                                     imageName: nil,
                                     fontName: CustomFonts.anonymousProBold.rawValue,
                                     fontSize: 14,
                                     tintColor: .primary, titleUnderscore: true)
        
        allQuizzesButton.configureButton(title: "Усі квізи",
                                         imageName: nil,
                                         fontName: CustomFonts.anonymousProBold.rawValue,
                                         fontSize: 14,
                                         tintColor: .primary)
        
        nextQuizButton.configureButton(title: "Наступний квіз",
                                       imageName: "rightArrow",
                                       fontName: CustomFonts.anonymousProBold.rawValue,
                                       fontSize: 14,
                                       tintColor: .primary)
    }
    
    private func configureProgressBar() {
        
        progressBar.progressTintColor = .white
        progressBar.trackTintColor = UIColor(white: 1, alpha: 0.2)
        progressBar.progress = (viewModel?.getProgress() ?? 0.0)
    }
    
    //MARK: - Bindings 
    
    private func bindButtons() {
        
        guard let viewModel else { return }
        
        repeatButton.rx.tap
            .bind(to: viewModel.repeatCurrentQuiz)
            .disposed(by: bag)
        
        allQuizzesButton.rx.tap
            .bind(to: viewModel.openAllQuizzes)
            .disposed(by: bag)
        
        nextQuizButton.rx.tap
            .bind(to: viewModel.goToNextQuizz)
            .disposed(by: bag)
    }

}
