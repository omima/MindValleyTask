//
//  Endpoint.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/17/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var base: String { get }
}

extension Endpoint {
    var base: String {
        return "https://pastebin.com/raw/"
    }
}
