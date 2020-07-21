//
//  ChannelsInteractor.swift
//  Parent
//
//  Created by Omima on 2020.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

class ChannelsInteractor {
    
    // MARK:- Properties
    weak var presenter: ChannelsInteractorOutputProtocol?
    private let service: ChannelApiService
    
    var newEpisodesList = [Media]()
    var channelList = [Channel]()
    var categoryList = [Category]()
    
    // MARK:- Initializers
    init(service: ChannelApiService) {
        self.service = service
    }
    
}

// MARK:- ChannelsInteractorInputProtocol
extension ChannelsInteractor: ChannelsInteractorInputProtocol {
    func loadChannels() {
        getNewEpisodes()
        getChannel()
        getCategory()
    }
    
    func getNewEpisodes() {
        service.fetchNewEpisodes { (result) in
            switch result {
            case .success(let response):
                self.newEpisodesList = response.data?.list ?? []
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getChannel()  {
        service.fetchChannel { (result) in
            switch result {
            case .success(let response):
                self.channelList = response.data?.channels ?? []
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCategory() {
        service.fetchCategory { (result) in
            switch result {
            case .success(let response):
                self.categoryList = response.data?.categories ?? []
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
