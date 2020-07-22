//
//  ChannelTableViewCell.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/19/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import UIKit
import Kingfisher

enum ChannelType {
    case series
    case media
}

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
    
    var media = [Series]()
    var channelType : ChannelType = .media
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setupCollection()
        registerCell()
    }
    
    // MARK: Private Methods
    fileprivate func setupCollection() {
        collectionView.delegate = self
               collectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
         flowLayout.scrollDirection = .horizontal
         flowLayout.itemSize = CGSize(width: 150, height: 290)
         flowLayout.minimumLineSpacing = 2.0
         flowLayout.minimumInteritemSpacing = 5.0
         self.collectionView.collectionViewLayout = flowLayout
         self.collectionView.showsHorizontalScrollIndicator = false
    }
    
    fileprivate func registerCell() {
        let MediaCell = UINib(nibName: "MediaCollectionViewCell", bundle: nil)
        self.collectionView.register(MediaCell, forCellWithReuseIdentifier: "MediaCollectionViewCell")
        let seriesCell = UINib(nibName: "SeriesCollectionViewCell", bundle: nil)
        self.collectionView.register(seriesCell, forCellWithReuseIdentifier: "SeriesCollectionViewCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK:  Methods
    func configureChannel(with item: Channel) {
        titleLabel.text = item.title
        if let imageURL = item.iconImage {
            iconView.kf.setImage(with: imageURL)
        }
        
        if item.series.isEmpty {
            channelType = .media
            self.media =  item.latestMedia
            descriptionLabel.text = "\(item.mediaCount) episodes"
        }else{
            channelType = .series
            self.media =  item.series
            descriptionLabel.text = "\(item.mediaCount) series"
        }        
    }
}

extension ChannelTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return media.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch channelType {
        case .media:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.mediaCellIdentifier, for: indexPath as IndexPath) as! MediaCollectionViewCell
            cell.configure(with: media[indexPath.row])
            return cell
         case .series:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.seriesCellIdentifier, for: indexPath as IndexPath) as! SeriesCollectionViewCell
            cell.configure(with: media[indexPath.row])
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
       }
    
}

struct MediaViewModel {
    var title : String
    var dec : String
    var image : URL?
}

