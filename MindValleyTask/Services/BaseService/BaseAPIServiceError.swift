//
//  BaseAPIServiceError.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/17/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

enum BaseAPIServiceError: LocalizedError {
    case parsingError
    case serverError(message: String)
    
    var errorDescription: String? {
        switch self {
        case .parsingError: return "JSON Parsing Failure"
        case .serverError(let message): return "\(message)"
        }
    }
}
