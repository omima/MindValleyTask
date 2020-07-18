//
//  BaseAPIService.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/17/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation
import Alamofire

class BaseAPIService {
    
    static let sharedInstance = BaseAPIService()

    public enum HTTPMethod : String{
        case get = "GET"
        case post = "POST"
    }
    
    fileprivate func getFullUrl(for endPoint: Endpoint) -> String {
          return "\(endPoint.base)\(endPoint.path)"
      }
    
    func execute<Model: Codable>(endPoint: Endpoint, method:BaseAPIService.HTTPMethod = .get, completionHandler: @escaping (Swift.Result<Model, Error>) -> Void) {
    
        let endpointUrl = getFullUrl(for: endPoint)
        AF.request(endpointUrl, method: Alamofire.HTTPMethod.init(rawValue: method.rawValue), parameters: [:], headers: nil).responseData { (response) in
              switch response.result {
              case .success(let data):
                  do {
                      let object = try JSONDecoder().decode(Model.self, from: data)
                      completionHandler(Swift.Result.success(object))
                  }
                  catch {
                      completionHandler(Swift.Result.failure(BaseAPIServiceError.parsingError))
                  }
              case .failure(let error):
                completionHandler(Swift.Result.failure(BaseAPIServiceError.serverError(message: error.localizedDescription)))
              }
          }

    }
}
