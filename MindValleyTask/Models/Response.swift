//
//  Response.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/21/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

class  Response<T>: Codable where T: Codable {
    private(set) var data: T?
    
    enum CodingKeys : String , CodingKey {
        case data = "data"
    }
}
