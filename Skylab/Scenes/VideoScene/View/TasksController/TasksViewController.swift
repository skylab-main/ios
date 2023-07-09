//
//  TasksViewController.swift
//  Skylab
//
//  Created by Сергей Молодец on 06.07.2023.
//

import UIKit

class TasksViewController: UIViewController, Storyboarded {
    let placeHolderText = "Вставте ваш код сюди..."
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var codeView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var markButton: UIButton!
    var viewModel: VideoViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        taskLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 14, textColor: .primary, nil)
        taskLabel.text = viewModel?.task
        sendButton.configureButton(title: "Надіслати на перевірку", imageName: nil,
                                   fontName: CustomFonts.anonymousProBold.rawValue,
                                   fontSize: 14,
                                   tintColor: .primary)
        markButton.configureButton(title: "Позначити завдання виконаним", imageName: nil,
                                   fontName: CustomFonts.anonymousProBold.rawValue,
                                   fontSize: 14,
                                   tintColor: .primary)
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
    
    private func endEditing() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        codeView.resignFirstResponder()
    }
}

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
