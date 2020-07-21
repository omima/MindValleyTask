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
    var series : [Series]
    var mediaCount : Int
    var latestMedia : [Series]
    var coverImage : String?
    var iconImage : String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case series = "series"
        case mediaCount = "mediaCount"
        case latestMedia = "latestMedia"
        case iconImage = "iconAsset"
        case coverImage = "coverAsset"
    }
    
    enum coverkey : String , CodingKey {
        case coverImage = "url"
    }
    
    
    enum iconkey : String , CodingKey {
        case iconImage = "thumbnailUrl"
    }
    
    enum iconCodingKey : String , CodingKey {
          case iconImage = "url"
      }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decode(String.self, forKey: .title)
        series = try values.decode([Series].self, forKey: .series)
        mediaCount = try values.decode(Int.self, forKey: .mediaCount)
        latestMedia = try values.decode([Series].self, forKey: .latestMedia)
        
        let cover = try values.nestedContainer(keyedBy: coverkey.self, forKey: .coverImage)
        coverImage = try cover.decodeIfPresent(String.self, forKey: .coverImage)
                
        let icon = try? values.nestedContainer(keyedBy: iconkey.self, forKey: .iconImage)
        let iconContainer = try? values.nestedContainer(keyedBy: iconCodingKey.self, forKey: .iconImage)
       
        if let icon =  try icon?.decodeIfPresent(String.self, forKey: .iconImage) {
            iconImage = icon
        }else if let icon =  try iconContainer?.decodeIfPresent(String.self, forKey: .iconImage){
           iconImage  = icon
        }else {
            iconImage = nil
        }
        
        
    }
    
}

