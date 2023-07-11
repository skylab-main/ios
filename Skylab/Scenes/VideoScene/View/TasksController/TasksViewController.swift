//
//  TasksViewController.swift
//  Skylab
//
//  Created by Сергей Молодец on 06.07.2023.
//

import UIKit
import RxCocoa


class TasksViewController: BaseViewController, Storyboarded {
    
    // MARK: - let/var
    
    let placeHolderText = "Вставте ваш код сюди..."
    var viewModel: VideoViewModelProtocol?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var codeView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var markButton: UIButton!
    @IBOutlet weak var markButtonBorderView: DoubleBorderForView!
    
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
        sendButton.configureButton(title: "Надіслати на перевірку", imageName: nil,
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
        self.markButton.configureButton(title: "Завдання виконане!", imageName: nil,
                                        fontName: CustomFonts.anonymousProBold.rawValue,
                                        fontSize: 14,
                                        tintColor: .white)
    }
    private func markButtonUINormal() {
        self.markButtonBorderView.backgroundColor = .white
        self.markButtonBorderView.borderColor = .primary
        markButton.configureButton(title: "Позначити завдання виконаним", imageName: nil,
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
    
    // MARK: - Binding funcs
    private func bindViewModel() {
        markButton.rx.tap
            .subscribe { _ in
                self.viewModel?.markTask()
                self.updateMarkButton()
            }.disposed(by: bag)
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
