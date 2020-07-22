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
    
    func getNewEpisodes(completion: @escaping () -> ()) {
        service.fetchNewEpisodes { (result) in
            switch result {
            case .success(let response):
                self.newEpisodesList = response.data?.list ?? []
                completion()
            case .failure(let error):
                self.presenter?.errorOccured(error: error)
                completion()
            }
        }
    }
    
    func getChannel(completion: @escaping () -> ())  {
        service.fetchChannel { (result) in
            switch result {
            case .success(let response):
                self.channelList = response.data?.channels ?? []
                completion()
                
            case .failure(let error):
                print(error)
                self.presenter?.errorOccured(error: error)
            }
        }
    }
    
    func getCategory(completion: @escaping () -> ()) {
        
        service.fetchCategory { (result) in
            switch result {
            case .success(let response):
                self.categoryList = response.data?.categories ?? []
                completion()
            case .failure(let error):
                self.presenter?.errorOccured(error: error)
                completion()
                
            }
        }
    }
}
