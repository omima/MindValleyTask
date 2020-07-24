//
//  Series.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/18/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

struct Series : Codable {
    var title : String
    var image : MediaImage?
    var type : String? // for latestMedia
    
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
        
        if values.contains(.type){
            type = try values.decode(String.self, forKey: .type)
        }else{
            self.type = nil
        }
        image = try? values.decode(MediaImage.self, forKey: .image)
    }
}


struct MediaImage : Codable {
    var image : URL
    
    enum CodingKeys: String, CodingKey {
        case image = "url"
    }
    
    enum iconkey : String , CodingKey {
        case image = "thumbnailUrl"
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            image = try container.decode(URL.self, forKey: .image)
        } catch {
            let container = try decoder.container(keyedBy: iconkey.self)
            image = try container.decode(URL.self, forKey: .image)
        }
    }
}
