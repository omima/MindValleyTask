//
//  MediaWrapper.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/20/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

struct MediaWrapper : Codable {
    
    var list : [Media]
    
    enum CodingKeys : String , CodingKey {
        case list = "media"
    }
}
