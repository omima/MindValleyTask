//
//  ChannelService.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/20/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation


protocol ChannelService {
    
}


final class ChannelApiService : BaseAPIService {
    enum NewEpisodesEndPoint: Endpoint {
        var path: String {
            return "z5AExTtw"
        }
        
        
    }
    
    func fetchNewEpisodes(completion: @escaping (Result<MediaWrapper, Error>) -> ())  {

    }
}

extension ChannelApiService : ChannelService{
    
}
