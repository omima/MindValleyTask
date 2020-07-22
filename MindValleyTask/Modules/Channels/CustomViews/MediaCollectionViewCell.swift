//
//  MediaCollectionViewCell.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/18/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import UIKit

class MediaCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with item : Series) {
        if let imageURL = item.image {
            imageView.kf.setImage(with: imageURL)
        }
        titleLabel.text = item.title
        descriptionLabel.text = ""
    }
    
    
    func configureMedia(with item : Media) {
        if let imageURL = item.coverImage {
            imageView.kf.setImage(with: imageURL)
        }
        titleLabel.text = item.title
        descriptionLabel.text = item.channelName
    }
    

}
