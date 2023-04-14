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
    
    var viewModel: ChatGPTResponseViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        
        responseLabel.text = "During this intensive course, I gained hands-on experience developing iOS applications using Swift programming language and Xcode IDE. I learned how to design and develop user interfaces using UIKit framework and Autolayout, as well as how to implement functionality using the MVC architecture pattern. Through the course, I also gained experience working with APIs and web services, integrating features such as push notifications and in-app purchases. In addition, I learned best practices for debugging and troubleshooting, as well as strategies for optimizing app performance. By completing this course, I developed a solid foundation in iOS app development and am excited to apply my skills to real-world projects.During this intensive course, I gained hands-on experience developing iOS applications using Swift programming language and Xcode IDE. I learned how to design and develop user interfaces using UIKit framework and Autolayout, as well as how to implement functionality using the MVC architecture pattern. Through the course, I also gained experience working with APIs and web services, integrating features such as push notifications and in-app purchases. In addition, I learned best practices for debugging and troubleshooting, as well as strategies for optimizing app performance. By completing this course, I developed a solid foundation in iOS app development and am excited to apply my skills to real-world projects.During this intensive course, I gained hands-on experience developing iOS applications using Swift programming language and Xcode IDE. I learned how to design and develop user interfaces using UIKit framework and Autolayout, as well as how to implement functionality using the MVC architecture pattern. Through the course, I also gained experience working with APIs and web services, integrating features such as push notifications and in-app purchases. In addition, I learned best practices for debugging and troubleshooting, as well as strategies for optimizing app performance. By completing this course, I developed a solid foundation in iOS app development and am excited to apply my skills to real-world projects."
    }
    
    private func configureUI() {
        
        title = "Chat GPT Tasks"
        
        tasksLabel.textColor = .white
        tasksLabel.font = UIFont(name: "AnonymousPro-Bold", size: 20)
        view.backgroundColor = .primary
    }
    
  
}
