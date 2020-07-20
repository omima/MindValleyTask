//
//  Series.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/18/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

struct Series : Decodable {
    var title : String
    var image : String
    var type : String // for latestMedia
    
    enum CodingKeys: String, CodingKey {
        case title
        case image = "coverAsset"
        case type
    }
    
    enum coverkey : String , CodingKey {
        case image = "url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
       
        title = try values.decode(String.self, forKey: .title)
        type = try values.decode(String.self, forKey: .type)

        let cover = try values.nestedContainer(keyedBy: coverkey.self, forKey: .image)
        image = try cover.decode(String.self, forKey: .image)
    }
}


