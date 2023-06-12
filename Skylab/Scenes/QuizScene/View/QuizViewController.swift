//
//  QuizViewController.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit

class QuizViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var helpfulResourcesButton: UIButton!
    @IBOutlet weak var quizTopicsTableView: UITableView!
    
    var viewModel: QuizViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNavBarTitle()
    }
    
    private func configureUI() {
        
        self.view.backgroundColor = .primary
   
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.cornerRadius = 12
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        helpfulResourcesButton.configureButton(title: "Корисні ресурси",
                                               imageName: "rightArrow",
                                               fontName: "AnonymousPro-Bold",
                                               fontSize: 14,
                                               tintColor: .primary)
        
        quizTopicsTableView.delegate = self
        quizTopicsTableView.dataSource = self
    }
    
    private func configureNavBarTitle() {
            
        guard let navBar = navigationController?.navigationBar else { return }
        
        title = "Quiz"
        navBar.prefersLargeTitles = true
 
        navBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro-Bold", size: 28) ?? UIFont.systemFont(ofSize: 28),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        
        navBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro-Bold", size: 28) ?? UIFont.systemFont(ofSize: 28),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.tintColor = .white
        navBar.barTintColor = .primary
    }
}

extension QuizViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.quizTopicsArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuizViewController", for: indexPath) as? QuizTopicsTableViewCell
        else { return UITableViewCell() }
        
        let data = viewModel?.quizTopicsArray[indexPath.row]
        
        cell.configureCell(data: data ?? QuizTopicsModel(topic: "", progress: 0))
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let data = viewModel?.quizTopicsArray[indexPath.row].topic else { return }
        
        print(data)
    }
    
}
