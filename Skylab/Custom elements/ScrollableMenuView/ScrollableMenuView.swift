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
class ScrollableMenuView: UIView {
    
    weak var delegate: ScrollableMenuViewDelegate?
    
    var items = [UIColor]()
    
    let layout = SrollableMenuLayout()
    
    private lazy var collectionView: UICollectionView = {
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 80)
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.isUserInteractionEnabled = false
        pageControl.tintColor = .white
        pageControl.pageIndicatorTintColor = UIColor(white: 1, alpha: 0.5)
        pageControl.numberOfPages = items.count
        return pageControl
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCollectionView()
        setupConstraints()
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.identifier)
    }
    
    private func setupConstraints() {
        addSubview(collectionView)
        addSubview(pageControl)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 4),
            pageControl.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension ScrollableMenuView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell else { return
            UICollectionViewCell() }
        cell.titleLabel.text = items[indexPath.row].accessibilityName.capitalized
        return cell
    }
}

extension ScrollableMenuView: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        delegate?.getIndex(layout.currentPage)
        pageControl.currentPage = layout.currentPage
    }
}
