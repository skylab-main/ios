//
//  CourseDescriptionViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 23/05/2023.
//

import UIKit

class CourseDescriptionViewController: BaseViewController, Storyboarded {
    
    @IBOutlet var customView: CustomApplyForCourseView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var courseDescriptionLabel: UILabel!
    @IBOutlet weak var topicListButton: UIButton!
    @IBOutlet var figureViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarController?.tabBar.isHidden = false
    }
    
    private func configureUI () {
        view.backgroundColor = .primary
        
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.cornerRadius = 12
        
        topicListButton.setTitle("повний список тем курсу", for: .normal)
        topicListButton.titleLabel?.font = UIFont(name: "AnonymousPro-Bold", size: 14)
        topicListButton.tintColor = .primary
        
        for figure in figureViews {
            figure.backgroundColor = .primary
        }
        
        configureDescriprionLabel()
        customView.configureUI()
        configureNavBarTitle()
    }
    
    private func configureDescriprionLabel() {
        
        let text = "Наш навчальний курс ми створювали, керуючись досвідом реальних проектів. Завдання побудовані таким чином, щоб студенти рухалися від простого до більш складного поступово. Якщо студенту не дається якесь завдання, ментор допоможе впоратися з ним."
        let attributedString = NSMutableAttributedString(string: text)
        // Create a paragraph style
        let paragraphStyle = NSMutableParagraphStyle()
        // Set the line spacing (line height)
        paragraphStyle.lineSpacing = 8.0
        // Apply the paragraph style to the attributed string
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))

        // Set the attributed and configure text on the label
        courseDescriptionLabel.font = UIFont(name: "AnonymousPro-Bold", size: 14)
        courseDescriptionLabel.textColor = .primary
        courseDescriptionLabel.attributedText = attributedString
    }
    
    private func configureNavBarTitle() {
        
        guard let navBar = navigationController?.navigationBar else { return }
        
        navigationItem.title = "About"
        
        navBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        
        let backButtonImage = UIImage(named: "backArrow")
        navBar.backIndicatorImage = backButtonImage
        navBar.backIndicatorTransitionMaskImage = backButtonImage
        navBar.tintColor = .white
        navBar.barStyle = .default
        navBar.topItem?.backButtonDisplayMode = .minimal
    }

}
