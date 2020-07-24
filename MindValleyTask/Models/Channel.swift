//
//  Channel.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/17/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

struct  Channel : Codable {
    var title : String
    var series : [Series]?
    var mediaCount : Int
    var latestMedia : [Series]?
    var coverImage : MediaImage?
    var iconImage : MediaImage?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case series = "series"
        case mediaCount = "mediaCount"
        case latestMedia = "latestMedia"
        case iconImage = "iconAsset"
        case coverImage = "coverAsset"
    }

}

