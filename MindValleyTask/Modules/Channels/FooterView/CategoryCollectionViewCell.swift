//
//  CategoryCollectionViewCell.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/22/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with item : Category)  {
        categoryTitle.text = item.name
    }
}
