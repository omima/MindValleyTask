//
//  FooterView.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/22/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import UIKit

protocol FooterViewDelegate : class {
    func shouldUpdateViewLayout()
}

class FooterView: UIView {
    // MARK:- Constants
    struct Constants {
        static let categoryCellIdentifier = "CategoryCollectionViewCell"
    }
    
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionHeightConstraint: NSLayoutConstraint!

    var categoryList = [Category]()
    weak var delegte :FooterViewDelegate?

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
    
    func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false
    }
    
    func registerCell() {
        let categoryCell = UINib(nibName:  Constants.categoryCellIdentifier, bundle: nil)
        self.collectionView.register(categoryCell, forCellWithReuseIdentifier:  Constants.categoryCellIdentifier)
    }

    func configureCategory(with items :[Category]) {
        categoryList = items
        collectionView.reloadData()
        
        collectionHeightConstraint.constant = collectionView.collectionViewLayout.collectionViewContentSize.height + 10
        delegte?.shouldUpdateViewLayout()
    }
}

extension FooterView : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.categoryCellIdentifier, for: indexPath as IndexPath) as! CategoryCollectionViewCell
        cell.configure(with: categoryList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.frame.width / 2 - 22) , height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 10)
    }
}
