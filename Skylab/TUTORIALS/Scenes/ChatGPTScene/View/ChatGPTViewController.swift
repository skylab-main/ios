//
//  ChatGPTViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 13/04/2023.
//

import UIKit

class ChatGPTViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var topicsCollectionView: UICollectionView!
    @IBOutlet weak var complexitySegmentedControl: UISegmentedControl!
    @IBOutlet weak var chooseDifficultyLabel: UILabel!
    @IBOutlet weak var topicsLabel: UILabel!
    
    var viewModel: ChatGPTViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNavBarTitle()
    }

    //MARK: - UI Configurations
    
    private func configureUI() {
        
        topicsCollectionView.dataSource = self
        topicsCollectionView.delegate = self
        
        view.backgroundColor = UIColor.primary
        chooseDifficultyLabel.textColor = .systemGray3
        chooseDifficultyLabel.font = UIFont(name: "AnonymousPro-Bold", size: 16)
        topicsLabel.textColor = .white
        topicsLabel.font = UIFont(name: "AnonymousPro-Bold", size: 22)
        
        topicsCollectionView.layer.cornerRadius = 15
        topicsCollectionView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func configureNavBarTitle() {
        
        guard let navBar = navigationController?.navigationBar else { return }
        
        navigationItem.title = "Chat GPT"
        
        navBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AnonymousPro-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        
        let backButtonImage = UIImage(systemName: "arrow.backward")
        navBar.backIndicatorImage = backButtonImage
        navBar.backIndicatorTransitionMaskImage = backButtonImage
        navBar.tintColor = .white
        navBar.barStyle = .black
        navigationItem.backButtonTitle = ""
        
    }
    
}

//MARK: - Extensions

extension ChatGPTViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.topicsArray.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopicsCollectionViewCell",
                                                            for: indexPath) as? TopicsCollectionViewCell else { return UICollectionViewCell() }
        
        cell.updateCell(data: viewModel?.topicsArray[indexPath.row] ?? "Error")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = viewModel?.topicsArray[indexPath.row]
        let difficulty = complexitySegmentedControl.titleForSegment(at: complexitySegmentedControl.selectedSegmentIndex)
        
        viewModel?.openChatGPTResponseViewController(with: (item ?? "", difficulty ?? ""))
    }
    
}
