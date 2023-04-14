//
//  ChatGPTResponseViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 13/04/2023.
//

import UIKit

class ChatGPTResponseViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var responseScrollView: UIScrollView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tasksLabel: UILabel!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var responseView: UIView!
    
    var viewModel: ChatGPTResponseViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    //MARK: - UI Configuration
    
    private func configureUI() {
        
        title = "Chat GPT Tasks"
        
        responseLabel.text = ""
        tasksLabel.textColor = .white
        tasksLabel.font = UIFont(name: "AnonymousPro-Bold", size: 20)
        
        view.backgroundColor = .primary
        
        responseView.layer.cornerRadius = 15
        responseView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        responseScrollView.layer.cornerRadius = 15
        responseScrollView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        activityIndicator.startAnimating()
        
        viewModel?.sendRequest(completion: { [weak self] response in

            DispatchQueue.main.async {
                
                self?.responseLabel.text = response
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true
            }
        })
    }
}
