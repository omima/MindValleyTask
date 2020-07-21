//
//  CategoryWrapper.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/20/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

struct CategoryWrapper : Codable {
    var categories : [Category]

    enum CodingKeys : String , CodingKey {
        case categories
    }
}
