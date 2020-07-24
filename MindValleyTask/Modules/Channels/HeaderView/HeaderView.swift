//
//  HeaderView.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/22/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    // MARK:- Constants
    struct Constants {
        static let mediaCellIdentifier = "MediaCollectionViewCell"
        static let minCellHeight: CGFloat = 200
    }
    
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    var mediaList = [Media]()
    fileprivate var cellHeight: CGFloat = Constants.minCellHeight

    // MARK:- Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    override func prepareForInterfaceBuilder() {
        xibSetup()
    }
    
    override func xibSetup() {
        super.xibSetup()
        setupCollection()
        registerCell()
    }
    
    // MARK: Private Methods
   fileprivate func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false
    }
    
    fileprivate func registerCell() {
        let mediaCell = UINib(nibName:  Constants.mediaCellIdentifier, bundle: nil)
        self.collectionView.register(mediaCell, forCellWithReuseIdentifier:  Constants.mediaCellIdentifier)
    }
    
    func configureNewEpisodes(with items : [Media])  {
        mediaList = items
        collectionView.reloadData()
        cellHeight = max(mediaList.map{ MediaCollectionViewCell.heightMedia(item: $0, width: (self.frame.width / 2 - 22)) }.max() ?? 0, Constants.minCellHeight)
        collectionViewHeightConstraint?.constant = cellHeight
    }
}

extension HeaderView : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mediaList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.mediaCellIdentifier, for: indexPath as IndexPath) as! MediaCollectionViewCell
        cell.configureMedia(with: mediaList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.frame.width / 2 - 22) , height:  collectionViewHeightConstraint.constant )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}
