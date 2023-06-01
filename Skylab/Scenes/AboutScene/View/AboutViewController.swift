//
//  AboutViewController.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.04.2023.
//

import UIKit
import RxSwift

class AboutViewController: BaseViewController, Storyboarded {
    
    private let contactImages = [UIImage(named: "email"), UIImage(named: "telegram"), UIImage(named: "linkedin"), UIImage(named: "facebook")]
    
    var viewModel: AboutViewModelProtocol? 
    
    private let button: BaseButton = {
        let view = BaseButton(text: "опис курсу")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollableView: ScrollableMenuView = {
        let view = ScrollableMenuView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.items = ["quiz", "уроки", "про курс"]
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 24
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.textColor = .primary
        label.numberOfLines = 0
        label.text = "додаток був\nрозроблений\nстудентами Skylab"
        label.font = AnonymousPro.bold(size: 28).font()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.textColor = .primary
        label.text = "В першу чергу команда збирається з двох напрямків – це команда розробників додатків та представники вашої компанії. Обидві ці складові необхідні для успішної реалізації проекту, адже саме плідна взаємодія команди розробки з вашою компанією важлива для пошуку найправильніших та найвигідніших рішень."
        label.font = AnonymousPro.regular(size: 14).font()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let contactlabel: UILabel = {
        let label = UILabel()
        label.textColor = .primary
        label.numberOfLines = 0
        label.text = "Contact us:"
        label.font = AnonymousPro.bold(size: 20).font()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.decelerationRate = .normal
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigation()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tabBarController?.tabBar.isHidden = false
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .primary
        scrollableView.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showCourseDescription))
        button.addGestureRecognizer(tapGesture)
        for image in contactImages {
            let imageView = UIImageView(image: image)
            stackView.addArrangedSubview(imageView)
        }
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.register(PersonCell.self, forCellWithReuseIdentifier: PersonCell.identifier)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.trailing = 16
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(56), heightDimension: .absolute(40))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.trailing = 4
        section.contentInsets.leading = 20
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    @objc private func showCourseDescription() {
        
        print("showCourseDescription")
        viewModel?.openCourseDescriptionController.onNext(())
    }
    
    private func setupConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(backView)
        contentView.addSubview(scrollableView)
        contentView.addSubview(topLabel)
        contentView.addSubview(collectionView)
        contentView.addSubview(bottomLabel)
        contentView.addSubview(contactlabel)
        contentView.addSubview(stackView)
        contentView.addSubview(button)
        let scrollViewContraints = [
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ]
        let contentViewContraints = [
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -(navigationController?.navigationBar.frame.height ?? 0)+20),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 760),
        ]
        let scrollableViewContraints = [
            scrollableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        let backViewConstraints = [
            backView.topAnchor.constraint(equalTo: scrollableView.bottomAnchor),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ]
        let topLabelConstraints = [
            topLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 40),
            topLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            topLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
        ]
        let collectionViewConstraints = [
            collectionView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 40)
        ]
        let bottomLabelConstraints = [
            bottomLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30),
            bottomLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor),
            bottomLabel.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor),
        ]
        let contactlabelConstraints = [
            contactlabel.topAnchor.constraint(equalTo: bottomLabel.bottomAnchor, constant: 42),
            contactlabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor)
        ]
        let stackViewConstraints = [
            stackView.topAnchor.constraint(equalTo: contactlabel.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contactlabel.trailingAnchor, constant: 16),
            stackView.heightAnchor.constraint(equalTo: contactlabel.heightAnchor)
        ]
        for view in stackView.arrangedSubviews {
            view.widthAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true
        }
        let buttonConstraints = [
            button.topAnchor.constraint(equalTo: contactlabel.bottomAnchor, constant: 53),
            button.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: 230),
            button.heightAnchor.constraint(equalToConstant: 40),
        ]
        NSLayoutConstraint.activate(scrollViewContraints)
        NSLayoutConstraint.activate(contentViewContraints)
        NSLayoutConstraint.activate(scrollableViewContraints)
        NSLayoutConstraint.activate(backViewConstraints)
        NSLayoutConstraint.activate(topLabelConstraints)
        NSLayoutConstraint.activate(collectionViewConstraints)
        NSLayoutConstraint.activate(bottomLabelConstraints)
        NSLayoutConstraint.activate(contactlabelConstraints)
        NSLayoutConstraint.activate(stackViewConstraints)
        NSLayoutConstraint.activate(buttonConstraints)
    }
    
}

extension AboutViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCell.identifier, for: indexPath) as? PersonCell else { return UICollectionViewCell()}
        return cell
    }
}

extension AboutViewController: ScrollableMenuViewDelegate {
    func getIndex(_ index: Int) {
        print(index)
    }
}
