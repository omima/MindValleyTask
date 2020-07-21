//
//  CategoryWrapper.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/20/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

struct CategoryWrapper : Decodable {
    var categories : [Category]

    enum CodingKeys : String , CodingKey {
        case data
    }
    
    enum CategoryCodingKeys : String , CodingKey {
        case categories
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let contanier = try values.nestedContainer(keyedBy: CategoryCodingKeys.self, forKey: .data)
        
        categories = try contanier.decode([Category].self, forKey: .categories)
    }
    
}
