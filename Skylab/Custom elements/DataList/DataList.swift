//
//  DataList.swift
//  Skylab
//
//  Created by Liza on 18.04.2023.
//

import UIKit


protocol DataListDelegate: AnyObject {
    func elementPressed(_ index:Int)
}

class DataList: UIView {

    private var titles: [String] = []
    private var imageName: String? = nil
    private var progressValues: [Float]? = nil
    private let edgeInset: CGFloat = 20
    private let cellAspectRatio: CGFloat = 162/141
    
    weak var delegate: DataListDelegate?
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var dataListCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
        
    private func commonInit() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("DataList", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        initCollectionView()
    }
    
    private func initCollectionView() {
        self.dataListCollectionView.register(DataListCollectionViewCell.self, forCellWithReuseIdentifier: "DataListCollectionViewCell")
        self.dataListCollectionView.dataSource = self
        self.dataListCollectionView.delegate = self
        
    }
    func configure(titles: [String], imageName: String? = nil, progressValues: [Float]? = nil) {
        self.titles = titles
        self.imageName = imageName
        self.progressValues = progressValues
        self.dataListCollectionView.reloadData()
        
    }
    
}

extension DataList: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataListCollectionViewCell", for: indexPath) as? DataListCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = indexPath.item
        
        cell.configure(title: titles[item], imageName: imageName, progressValue: progressValues?[item])
       
        return cell
    }
    
    
}

extension DataList: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 2 * edgeInset - 10)/2
        
        return CGSize(width: width, height: width/cellAspectRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: edgeInset, left: edgeInset, bottom: edgeInset, right: edgeInset)
    }
    
}

extension DataList: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.elementPressed(indexPath.item)
    }
    
}
