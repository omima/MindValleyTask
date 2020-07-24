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
    var cache = ObjectCache.sharedInstance

    // MARK:- Initializers
    init(service: ChannelApiService) {
        self.service = service
    }
    
}

// MARK:- ChannelsInteractorInputProtocol
extension ChannelsInteractor: ChannelsInteractorInputProtocol {
    func loadChannels() {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        dispatchGroup.enter()
        dispatchGroup.enter()
        
        getNewEpisodes{
            dispatchGroup.leave()
        }
        getChannel{
            dispatchGroup.leave()
        }
        getCategory{
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main ){
            self.presenter?.channelsUpdated() // add view model
        }
    }
    
    
}
extension ChannelsInteractor {

    func getNewEpisodes(completion: @escaping () -> ()) {

        if let cachedWrapper: Response<MediaWrapper> = cache.retrieve(fileName: "MediaFile"){
            self.newEpisodesList = cachedWrapper.data?.list ?? []
            completion()
            return
        }
        service.fetchNewEpisodes { (result) in
            switch result {
            case .success(let response):
                self.newEpisodesList = response.data?.list ?? []
                self.cache.store(object: response, fileName: "MediaFile")
                completion()
            case .failure(let error):
                self.presenter?.errorOccured(error: error)
                completion()
            }
        }
    }
    
    func getChannel(completion: @escaping () -> ())  {
        if let channelResponse: Response<ChannelWrapper> = cache.retrieve(fileName: "ChannelFile"){
            self.channelList = channelResponse.data?.channels ?? []
            completion()
            return
        }
        service.fetchChannel { (result) in
            switch result {
            case .success(let response):
                self.channelList = response.data?.channels ?? []
                self.cache.store(object: response, fileName: "ChannelFile")
                completion()
            case .failure(let error):
                print(error)
                self.presenter?.errorOccured(error: error)
            }
        }
    }
    
    func getCategory(completion: @escaping () -> ()) {

        if let cachedWrapper: CategoryWrapper = cache.retrieve(fileName: "CategorFile"){
            self.categoryList = cachedWrapper.categories
            completion()
            return
        }
        service.fetchCategory { (result) in
            switch result {
            case .success(let response):
                self.categoryList = response.data?.categories ?? []
                self.cache.store(object: response.data, fileName: "CategorFile")
                completion()
            case .failure(let error):
                self.presenter?.errorOccured(error: error)
                completion()
                
            }
        }
    }
}
