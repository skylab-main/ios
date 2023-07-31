//
//  AuthorizationAPIViewController.swift
//  Skylab
//
//  Created by Сергей Молодец on 29.07.2023.
//

import UIKit
import RxSwift

class AuthorizationAPIViewController: BaseViewController, Storyboarded {
    
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var keyTextField: UITextField!
    @IBOutlet weak var manualButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
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
        configureKeyTextField()
        configureManualButton()
        configureContinueButton()
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
        topLabel.text = NSLocalizedString("AuthorizationAPIViewController.topLabel.text", comment: "Text for the top label on the api key putting screen")
    }
    private func configureKeyTextField() {
        keyTextField.borderStyle = .none
        keyTextField.layer.borderWidth = 1
        keyTextField.layer.borderColor = UIColor.primary.cgColor
        keyTextField.layer.cornerRadius = 12
        keyTextField.textColor = .primary
        keyTextField.font = UIFont(name: CustomFonts.anonymousProBold.rawValue, size: 14)
        let placeholderText = NSLocalizedString("AuthorizationAPIViewController.keyTextField.placeholder.text", comment: "Placeholder ext for the api key textField on the api key putting screen")
                let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.primary,
                    .font: UIFont(name: CustomFonts.anonymousProBold.rawValue, size: 14) ?? UIFont.systemFont(ofSize: 14)
                ]
                let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        keyTextField.attributedPlaceholder = attributedPlaceholder

    }
    private func configureManualButton() {
        manualButton.tintColor = .primary
        manualButton.alpha = 0.7
        let titleText = NSLocalizedString("AuthorizationAPIViewController.manualButton.title.text", comment: "Manual of getting API key")
                let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.primary,
                    .font: UIFont(name: CustomFonts.anonymousProBold.rawValue, size: 12) ?? UIFont.systemFont(ofSize: 12)
                ]
                let attributedTitle = NSAttributedString(string: titleText, attributes: attributes)
        manualButton.setAttributedTitle(attributedTitle, for: .normal)
        
    }
    private func configureContinueButton() {
        continueButton.configureButton(title: NSLocalizedString("AuthorizationAPIViewController.continueButton.title", comment: "title for the continueButton"), imageName: nil,
                                   fontName: CustomFonts.anonymousProBold.rawValue,
                                   fontSize: 14,
                                   tintColor: .primary)
    }
    
    // MARK: - Binding funcs
    private func bindViewModel() {
        if let viewModel {
            continueButton.rx.tap
                .bind(to: viewModel.openResultCheckController)
                .disposed(by: bag)
            manualButton.rx.tap
                .bind(to: viewModel.openApiManualDoc)
                .disposed(by: bag)
        }
    }
    
    
}
