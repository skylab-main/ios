//
//  ScrollableMenuLayout.swift
//  Skylab
//
//  Created by Artem Tkachenko on 18.03.2023.
//

import UIKit

class SrollableMenuLayout: UICollectionViewFlowLayout {
    
    var previousOffset: CGFloat = 0.0
    var currentPage = 0
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let cv = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset,
                                             withScrollingVelocity: velocity)
        }
        let itemCount = cv.numberOfItems (inSection: 0)
        
        if previousOffset > cv.contentOffset.x && velocity.x < 0.0 {
            currentPage = max (currentPage-1, 0)
        } else if previousOffset < cv.contentOffset.x && velocity.x > 0.0 {
            currentPage = min (currentPage+1, itemCount-1)
        }
        
        let width = cv.frame.width - sectionInset.left - sectionInset.right
        let itemWidth = itemSize.width
        let spacing = minimumLineSpacing
        let edge = (width - itemWidth - spacing * 2) / 2
        let offset = (itemWidth + spacing) * CGFloat (currentPage) - (edge + spacing)
        previousOffset = offset
        return CGPoint(x: offset, y: proposedContentOffset.y)
    }
}
