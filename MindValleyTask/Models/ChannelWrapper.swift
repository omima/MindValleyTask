//
//  ChannelWrapper.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/20/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

struct ChannelWrapper : Codable {
    var channels :[Channel]
    
    enum CodingKeys : String , CodingKey {
        case channels
    }
    
}
