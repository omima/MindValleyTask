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
    var coverImage:MediaImage?
    var channelName : ChannalType
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case title = "title"
        case coverImage = "coverAsset"
        case channelName = "channel"
    }
    
    enum channelTitlekey : String , CodingKey {
        case channelName = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decode(String.self, forKey: .title)
        type = try values.decode(String.self, forKey: .type)
        coverImage = try? values.decode(MediaImage.self, forKey: .coverImage)
        channelName = try values.decode(ChannalType.self, forKey: .channelName)
        
    }
}


struct ChannalType : Codable {
    var title : String
    
    enum CodingKeys : String , CodingKey {
        case title = "title"
    }
}
