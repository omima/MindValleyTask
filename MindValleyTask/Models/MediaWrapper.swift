//
//  MediaWrapper.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/20/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

struct MediaWrapper : Decodable {
    var list : [Media]

    enum CodingKeys : String , CodingKey {
        case data
    }
    
    enum MediaCodingKeys : String , CodingKey {
        case list = "media"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let contanier = try values.nestedContainer(keyedBy: MediaCodingKeys.self, forKey: .data)
        
        list = try contanier.decode([Media].self, forKey: .list)
    }
    
}
