//
//  CourseDescriptionViewController.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 23/05/2023.
//

import UIKit
import RxSwift
import RxCocoa

class CourseDescriptionViewController: BaseViewController, Storyboarded {
    
    @IBOutlet var customView: CustomApplyForCourseView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var courseDescriptionLabel: UILabel!
    @IBOutlet weak var topicListButton: UIButton!
    @IBOutlet var figureViews: [UIView]!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var reviewsCollectionView: UICollectionView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    var viewModel: CourseDescriptionViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        bindTopicListButton()
    }
    
    //MARK: - UI Configurations
    
    private func configureUI() {
        
        mainScrollView.backgroundColor = .primary
        
        backgroundView.layer.configureViewLayer(cornerRadius: 12,
                                                borderWidth: nil,
                                                borderColor: nil, nil)
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        topicListButton.setTitle("повний список тем курсу", for: .normal)
        topicListButton.titleLabel?.font = UIFont(name: "AnonymousPro-Bold", size: 14)
        topicListButton.tintColor = .primary
        
        reviewsLabel.text = "відгуки студентів"
        reviewsLabel.configureCustomLabel(font: .anonymousProBold,
                                            fontSize: 28,
                                            textColor: .primary, nil)
        
        courseDescriptionLabel.text = "Наш навчальний курс ми створювали, керуючись досвідом реальних проектів. Завдання побудовані таким чином, щоб студенти рухалися від простого до більш складного поступово. Якщо студенту не дається якесь завдання, ментор допоможе впоратися з ним."
        courseDescriptionLabel.configureCustomLabel(font: .anonymousProBold,
                                                    fontSize: 14,
                                                    textColor: .primary, 8)
        
        for figure in figureViews {
            figure.backgroundColor = .primary
        }
        
        reviewsCollectionView.dataSource = self
    
        customView.configureUI()
        configureNavBarTitle()
    }
    
    private func configureNavBarTitle() {
        
        guard let navBar = navigationController?.navigationBar else { return }
        
        navigationItem.title = "About"
        navBar.prefersLargeTitles = false
        
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
    
    //MARK: - RxSwift Bindings
    
    private func bindTopicListButton() {
                
        guard let viewModel else { return }
        topicListButton
            .rx
            .tap
            .bind(to: viewModel.openCourseDetailsController)
            .disposed(by: bag)
    }
}

//MARK: - Extensions

extension CourseDescriptionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.reviewsArray.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard
            let model = viewModel,
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewsCollectionViewCell",
                                                          for: indexPath) as? ReviewsCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.configureCell(model: model.reviewsArray[indexPath.row])
        
        return cell
    }
}
