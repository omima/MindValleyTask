//
//  ChannelService.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/20/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation


protocol ChannelService {
    func fetchNewEpisodes(_ completion: @escaping (Result<Response<MediaWrapper>, Error>) -> ())
    func fetchCategory(_ completion: @escaping (Result<Response<CategoryWrapper>, Error>) -> ())
    func fetchChannel(_ completion: @escaping (Result<Response<ChannelWrapper>, Error>) -> ())
}


final class ChannelApiService : BaseAPIService {
    enum ChannelEndPoint: Endpoint {
        case newEpisodes
        case category
        case channel
        
        var path: String {
            switch self {
            case .newEpisodes:
                return "z5AExTtw"
            case .category :
                return "A0CgArX3"
            case .channel :
                return "Xt12uVhM"
            }
        }
    }
}

extension ChannelApiService : ChannelService{
    func fetchNewEpisodes(_ completion: @escaping (Result<Response<MediaWrapper>, Error>) -> ()) {
        execute(endPoint: ChannelEndPoint.newEpisodes) { (result) in
            completion(result)
        }
    }
    
    func fetchCategory(_ completion: @escaping (Result<Response<CategoryWrapper>, Error>) -> ()) {
        execute(endPoint: ChannelEndPoint.category) { (result) in
            completion(result)
        }
    }
    
    func fetchChannel(_ completion: @escaping (Result<Response<ChannelWrapper>, Error>) -> ()) {
        execute(endPoint: ChannelEndPoint.channel) { (result) in
            completion(result)
        }
    }
    
}
