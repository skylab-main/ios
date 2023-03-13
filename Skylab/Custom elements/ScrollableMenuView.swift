//
//  ScrollableMenuView.swift
//  Skylab
//
//  Created by Artem Tkachenko on 12.03.2023.
//

import UIKit

protocol ScrollableMenuViewDelegate: AnyObject {
    func getIndex(_ index: Int)
}

@IBDesignable
final class ScrollableMenuView: UIView {
    
    weak var delegate: ScrollableMenuViewDelegate?
    
    var colors = [UIColor]()
    
    private var currentIndex = 0 {
        didSet {
            delegate?.getIndex(currentIndex)
            pageControl.currentPage = currentIndex
            collectionView.scrollToItem(at: IndexPath(row: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setupLayout())
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.isUserInteractionEnabled = true
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = UIColor(white: 1, alpha: 0.5)
        pageControl.numberOfPages = colors.count
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCollectionView()
        setupConstraints()
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(viewSwiped(_:)))
        swipeLeft.direction = .left
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(viewSwiped(_:)))
        swipeRight.direction = .right
        collectionView.addGestureRecognizer(swipeLeft)
        collectionView.addGestureRecognizer(swipeRight)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.identifier)
    }
    
    @objc func pageControlDidChange(_ sender: UIPageControl) {
        currentIndex = sender.currentPage
    }
    
    @objc func viewSwiped(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            currentIndex = (currentIndex + 1) % colors.count
        } else if sender.direction == .right {
            currentIndex = (currentIndex + colors.count - 1) % colors.count
        }
    }
    
    private func setupLayout() -> UICollectionViewLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 300, height: 80)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 16
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return flowLayout
    }
    
    private func setupConstraints() {
        addSubview(collectionView)
        addSubview(pageControl)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -4),
            
            pageControl.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageControl.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension ScrollableMenuView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell else { return
            UICollectionViewCell() }
        cell.titleLabel.text = colors[indexPath.row].accessibilityName.capitalized
        return cell
    }
}

extension ScrollableMenuView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentIndex = indexPath.row
    }
}

