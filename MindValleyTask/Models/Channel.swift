//
//  Channel.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/17/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

struct  Channel : Decodable {
    var id : Int
    var title : String
    var series : [Series]
    var mediaCount : Int
    var latestMedia : [Series]
    var coverImage : String
    var iconImage : String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case series
        case mediaCount
        case latestMedia
        case iconImage = "iconAsset"
        case coverImage = "coverAsset"
    }
    
    enum coverkey : String , CodingKey {
        case coverImage = "url"
    }
    
    enum iconkey : String , CodingKey {
        case iconImage = "thumbnailUrl"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        series = try values.decode([Series].self, forKey: .series)
        mediaCount = try values.decode(Int.self, forKey: .mediaCount)
        latestMedia = try values.decode([Series].self, forKey: .latestMedia)
        
        let cover = try values.nestedContainer(keyedBy: coverkey.self, forKey: .coverImage)
        coverImage = try cover.decode(String.self, forKey: .coverImage)
        
        let icon = try values.nestedContainer(keyedBy: iconkey.self, forKey: .iconImage)
        iconImage = try icon.decode(String.self, forKey: .iconImage)
    }
    
}

