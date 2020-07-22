//
//  ChannelTableViewCell.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/19/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import UIKit
import Kingfisher

class ChannelTableViewCell: UITableViewCell {
    
    // MARK:- Constants
    struct Constants {
        static let mediaCellIdentifier = "MediaCollectionViewCell"
        static let seriesCellIdentifier = "SeriesCollectionViewCell"
        
    }
    // MARK: Outlets
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func configureChannel(with item: Channel) {
        
        titleLabel.text = item.title
        descriptionLabel.text = "\(item.mediaCount)"
        if let imageURL = item.iconImage {
            iconView.kf.setImage(with: imageURL)
        }
        if item.series.isEmpty {
            
        }else{
            
        }
        
        
    }
}

extension ChannelTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.mediaCellIdentifier, for: indexPath as IndexPath) as! MediaCollectionViewCell
        return cell
        
        
    }
    
    
}

struct MediaViewModel {
    var title : String
    var dec : String
    var image : URL?
}
