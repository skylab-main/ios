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
    }

    //MARK: - UI Configurations
    
    private func configureUI() {
        
        title = "Chat GPT Topics"
        
        topicsCollectionView.dataSource = self
        
        view.backgroundColor = UIColor.primary
        chooseDifficultyLabel.textColor = .systemGray3
        topicsLabel.textColor = .white
        
        setupNavBar()
    }
    
    private func setupNavBar() {
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
    }

}

//MARK: - Extensions

extension ChatGPTViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.topicsArray.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopicsCollectionViewCell",
                                                            for: indexPath) as? TopicsCollectionViewCell else { return UICollectionViewCell() }
        
        cell.updateCell(data: viewModel?.topicsArray[indexPath.row] ?? "Error")
        
        return cell
    }
    
}
