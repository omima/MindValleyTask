//
//  ChannelsPresenter.swift
//  Parent
//
//  Created by Omima on 2020.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//


import Foundation

class ChannelsPresenter {
    
    // MARK:- Properties
    weak var view: ChannelsViewProtocol?
    var interactor: ChannelsInteractorInputProtocol?
    var wireFrame: ChannelsWireFrameProtocol?
    
    fileprivate func getNewEpisodes() -> [Media] {
       return interactor!.newEpisodesList
    }
    
    fileprivate func getCategoryList() -> [Category] {
        return interactor!.categoryList
    }
}

// MARK:- ChannelsPresenterProtocol
extension ChannelsPresenter: ChannelsPresenterProtocol {
    func viewLoaded() {
        view?.showLoader()
        interactor?.loadChannels()
    }
    

    
    func numberOfItems() -> Int {
        return interactor?.channelList.count ?? 0
    }

    func getChannelItem(at index : Int) -> Channel {
        return interactor!.channelList[index]
    }
    
}

// MARK:- ChannelsInteractorOutputProtocol
extension ChannelsPresenter: ChannelsInteractorOutputProtocol {
    func channelsUpdated() {
        view?.reloadData()
        view?.headerView.configureNewEpisodes(with: getNewEpisodes())
        view?.footerView.configureCategory(with: getCategoryList())
    }
    
    func loadStateUpdated(isLoading: Bool) {
        if isLoading {
            view?.showLoader()
        } else {
            view?.hideLoader()
        }
    }
    
    func errorOccured(error: Error) {
        view?.hideLoader()
        view?.showErrorMessage(text: error.localizedDescription)
    }
    
}

struct ChannelViewModel<T> {
    var title  : String
    var list : [T]
}
