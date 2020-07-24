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
        if let imageURL = item.image?.image {
            imageView.kf.setImage(with: imageURL)
        }
        titleLabel.text = item.title
        descriptionLabel.text = ""
    }
    
    
    func configureMedia(with item : Media) {
        if let imageURL = item.coverImage?.image {
            imageView.kf.setImage(with: imageURL)
        }
        titleLabel.text = item.title
        descriptionLabel.text = item.channelName.title
    }
    
    static func height(item: Series, width: CGFloat) -> CGFloat {
        
        let textWidth = width - 15
        var height: CGFloat = 0
        
        height += item.title.height(withWidth: textWidth, font: UIFont.robotoBold(size: 17)) + 5
        height += 230 // image hieght
        return height
    }
    
    static func heightMedia(item: Media, width: CGFloat) -> CGFloat {
        
        let textWidth = width - 15
        var height: CGFloat = 0
        
        height += item.title.height(withWidth: textWidth, font: UIFont.robotoBold(size: 17))
        height += item.channelName.title.height(withWidth: textWidth, font: UIFont.robotoBold(size: 13))
        
        height += 230 // image hieght
        return height
    }

}
