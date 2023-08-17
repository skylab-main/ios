//
//  ResultCheckViewController.swift
//  Skylab
//
//  Created by Сергей Молодец on 31.07.2023.
//

import UIKit
import RxSwift

class ResultCheckViewController: BaseViewController, Storyboarded {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var codeView: UITextView!
    @IBOutlet weak var repeatButton: UIButton!
    // MARK: - let/var
    var viewModel: ResultCheckViewModelProtocol?
    
    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindViewModel()
    }
    // MARK: - UI Configurations funcs
    private func configureUI() {
        configureContainerView()
        configureNavigationBar()
        configureTopLabel()
        configureCodeView()
        configureRepeatButton()
    }
    
    private func configureContainerView() {
        self.view.backgroundColor = .primary
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 12
        containerView.clipsToBounds = true
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    private func configureNavigationBar() {
        navigationController?.navigationBar.primaryStyle()
        navigationItem.title = NSLocalizedString("ResultScene.UINavigationBar.Title", comment: "Title for checking task screeeen")
    }
    private func configureTopLabel() {
        topLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 14, textColor: .primary, nil)
        topLabel.text = viewModel?.solutionData["task"]
    }
    private func configureCodeView() {
        codeView.layer.borderWidth = 1
        codeView.layer.borderColor = UIColor.primary.cgColor
        codeView.layer.cornerRadius = 12
        codeView.textColor = .primary
        codeView.font = UIFont(name: CustomFonts.anonymousProBold.rawValue, size: 14)
        codeView.text = "Результат перевiрки:"
        codeView.textContainerInset = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
        // TODO: - show result from chatGPT
    }
    private func configureRepeatButton() {
        repeatButton.configureButton(title: NSLocalizedString("ResultCheckViewController.repeatButton.title", comment: "title for the tryy again button on the result screen"), imageName: nil,
                                     fontName: CustomFonts.anonymousProBold.rawValue,
                                     fontSize: 14,
                                     tintColor: .primary)
    }
    
    // MARK: - Binding funcs
    private func bindViewModel() {
        guard let viewModel else { return }
            repeatButton.rx.tap
                .bind(to: viewModel.goToVideoScene)
                .disposed(by: bag)
    }
    
    
}
