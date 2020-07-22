//
//  FooterView.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/22/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import UIKit

class FooterView: UIView {

    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
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

    func configureCategory(with items :[Category]) {
        
    }
}
