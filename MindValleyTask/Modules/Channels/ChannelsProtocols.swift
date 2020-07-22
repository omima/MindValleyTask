//
//  ChannelsProtocols.swift
//  Parent
//
//  Created by Omima on 2020.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

// MARK:- View protocols
// MARK: Presenter -> View
protocol ChannelsViewProtocol: BaseViewing {
    var presenter: ChannelsPresenterProtocol? { get set }
    var headerView: HeaderView! { get }
    var footerView: FooterView! { get }

    func reloadData()
}

// MARK:- Presenter protocols
// MARK: View -> Presenter
protocol ChannelsPresenterProtocol: class {
    var view: ChannelsViewProtocol? { get set }
    var interactor: ChannelsInteractorInputProtocol? { get set }
    var wireFrame: ChannelsWireFrameProtocol? { get set }
    
    func viewLoaded()
    func numberOfItems() -> Int
    func getChannelItem(at index : Int) -> Channel

}

// MARK: Interactor -> Presenter
protocol ChannelsInteractorOutputProtocol: class {
    func channelsUpdated()
    func loadStateUpdated(isLoading: Bool)
    func errorOccured(error: Error)
}

// MARK:- Interactor Protocols
// MARK: Presenter -> Interactor
protocol ChannelsInteractorInputProtocol: class {
    var presenter: ChannelsInteractorOutputProtocol? { get set }
    var newEpisodesList : [Media] { get }
    var channelList : [Channel] { get }
    var categoryList: [Category] { get }
    
    func loadChannels() 

}

// MARK:- Wireframe Protocols
protocol ChannelsWireFrameProtocol: class {
    static func createChannelsView() -> ChannelsView
}

