//
//  Media.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/17/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

struct Media : Codable {
    var type: String
    var title: String
    var coverImage:URL?
    var channelName : String
    
    enum CodingKeys: String, CodingKey {
        case type
        case title
        case coverImage = "coverAsset"
        case channelName = "channel"
    }
    
    enum coverkey : String , CodingKey {
        case coverImage = "url"
    }
    
    enum channelTitlekey : String , CodingKey {
        case channelName = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decode(String.self, forKey: .title)
        type = try values.decode(String.self, forKey: .type)
        
        let cover = try values.nestedContainer(keyedBy: coverkey.self, forKey: .coverImage)
        coverImage = try? cover.decode(URL.self, forKey: .coverImage)
        
        let channelTitle = try values.nestedContainer(keyedBy: channelTitlekey.self, forKey: .channelName)
        channelName = try channelTitle.decode(String.self, forKey: .channelName)
        
    }
}


