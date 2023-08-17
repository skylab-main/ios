//
//  TasksViewController.swift
//  Skylab
//
//  Created by Сергей Молодец on 06.07.2023.
//

import UIKit
import RxCocoa


class TasksViewController: BaseViewController, Storyboarded {
    
    // MARK: - IBOutlets
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var codeView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var markButton: UIButton!
    @IBOutlet weak var markButtonBorderView: DoubleBorderForView!
    
    // MARK: - let/var
    let placeHolderText = NSLocalizedString("TasksViewController.codeView.placeHolderText", comment: "Placeholder text in view for code")
    var viewModel: VideoViewModelProtocol?
    
    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindViewModel()
        updateMarkButton()
    }
    
    // MARK: - UI Configurations funcs
    private func configureUI() {
        taskLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 14, textColor: .primary, nil)
        taskLabel.text = viewModel?.task
        sendButton.configureButton(title: NSLocalizedString("TasksViewController.sendButton.title", comment: "title of the send button on tasks screen"), imageName: nil,
                                   fontName: CustomFonts.anonymousProBold.rawValue,
                                   fontSize: 14,
                                   tintColor: .primary)
        markButtonUINormal()
        editCodeView()
    }
    
    private func editCodeView() {
        codeView.layer.borderWidth = 1
        codeView.layer.borderColor = UIColor.primary.cgColor
        codeView.layer.cornerRadius = 12
        codeView.textColor = .primary
        codeView.font = UIFont(name: CustomFonts.anonymousProBold.rawValue, size: 14)
        codeView.text = placeHolderText
        codeView.textContainerInset = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
        codeView.delegate = self
        endEditing()
    }
    private func markButtonUIpressed() {
        self.markButtonBorderView.backgroundColor = .primary
        self.markButtonBorderView.borderColor = .white
        self.markButton.configureButton(title: NSLocalizedString("TasksViewController.markButton.pressed.title", comment: "title of the markButton to make task is done"), imageName: nil,
                                        fontName: CustomFonts.anonymousProBold.rawValue,
                                        fontSize: 14,
                                        tintColor: .white)
    }
    private func markButtonUINormal() {
        self.markButtonBorderView.backgroundColor = .white
        self.markButtonBorderView.borderColor = .primary
        markButton.configureButton(title: NSLocalizedString("TasksViewController.markButton.nonPressed.title", comment: "title for the normal state of markButton"), imageName: nil,
                                   fontName: CustomFonts.anonymousProBold.rawValue,
                                   fontSize: 14,
                                   tintColor: .primary)
    }
    
    // MARK: - Flow funcs
    private func endEditing() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func updateMarkButton() {
        if let check = viewModel?.checkTaskIsDone(),
           check {
            markButtonUIpressed()
        } else {
            markButtonUINormal()
        }
    }
    
    private func checkCodeView(_ text: String) -> Bool {
        if text == placeHolderText || text.count < 10 {
            let alertController = UIAlertController(title: NSLocalizedString("TasksViewController.alertController.title", comment: "Title of the allertview when soultion code isn't putted"), message: NSLocalizedString("TasksViewController.alertController.message", comment: "Message of the allertview when soultion code isn't putted"), preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return false
        } else {
            return true
        }
    }
    
    // MARK: - Binding funcs
    private func bindViewModel() {
        guard let viewModel else { return }
        markButton.rx.tap
            .subscribe { [weak self]  _ in
                self?.viewModel?.markTask()
                self?.updateMarkButton()
            }.disposed(by: bag)
            sendButton.rx.tap
                .withLatestFrom(codeView.rx.text.orEmpty)
                .filter { self.checkCodeView($0) }
                .map { [ "task" : self.taskLabel.text ?? "", "solution" : $0 ] }
                .bind(to: viewModel.taskData)
                .disposed(by: bag)
    }
    
    // MARK: - IBActions funcs
    @IBAction func dismissKeyboard() {
        codeView.resignFirstResponder()
    }
    
}

// MARK: - Extensions
extension TasksViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeHolderText {
            textView.text = nil
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeHolderText
        }
    }
    
}
