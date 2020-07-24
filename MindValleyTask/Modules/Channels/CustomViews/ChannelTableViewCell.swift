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

protocol ChannelCellDelegate: class {
    func shouldUpadteViewLayout()
}

class ChannelTableViewCell: UITableViewCell {
    
    // MARK:- Constants
    struct Constants {
        static let mediaCellIdentifier = "MediaCollectionViewCell"
        static let seriesCellIdentifier = "SeriesCollectionViewCell"
        static let minCellHeight: CGFloat = 200
    }
    // MARK: Outlets
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!

    var channelType : ChannelType = .media
    weak var delegate : ChannelCellDelegate?
    var media = [Series]()
   fileprivate var cellHeight: CGFloat = Constants.minCellHeight

    override func awakeFromNib() {
        super.awakeFromNib()
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
        let mediaCell = UINib(nibName: "MediaCollectionViewCell", bundle: nil)
        self.collectionView.register(mediaCell, forCellWithReuseIdentifier: "MediaCollectionViewCell")
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
        
        if item.series?.isEmpty ?? false {
            channelType = .media
            self.media =  item.latestMedia ?? []
            descriptionLabel.text = "\(item.mediaCount) episodes"
          
            cellHeight = max(media.map{ MediaCollectionViewCell.height(item: $0, width: (self.frame.width / 2 - 22)) }.max() ?? 0, Constants.minCellHeight)
            collectionViewHeight?.constant = cellHeight
            collectionView.reloadData()
        }else{
            channelType = .series
            self.media =  item.series ?? []
            descriptionLabel.text = "\(item.mediaCount) series"
            collectionView.reloadData()
            collectionViewHeight.constant = 260
        }
        delegate?.shouldUpadteViewLayout()
    }
}

extension ChannelTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
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
        return UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch channelType {
        case .media:
            return CGSize(width: (self.frame.width / 2 - 22) , height: cellHeight)
        case .series:
            return CGSize(width: (self.frame.width - 20) , height: 260)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  5
    }
    
}
