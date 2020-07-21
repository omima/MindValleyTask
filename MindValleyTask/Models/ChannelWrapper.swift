//
//  ChannelWrapper.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/20/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

struct ChannelWrapper : Decodable {
    var channels :[Channel]
    
    enum CodingKeys : String , CodingKey {
        case data
    }
    
    enum ChannelCodingKeys : String , CodingKey {
        case channels
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let channelContanier = try values.nestedContainer(keyedBy: ChannelCodingKeys.self, forKey: .data)
        
        channels = try channelContanier.decode([Channel].self, forKey: .channels)
    }
    
}
