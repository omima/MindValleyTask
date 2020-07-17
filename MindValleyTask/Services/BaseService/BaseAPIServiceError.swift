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
    case serverError(message: String, code: Int)
    
    var errorDescription: String? {
        switch self {
        case .parsingError: return "JSON Parsing Failure"
        case .serverError(let message, let code): return "\(message)<\(code)>"
        }
    }
}
