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
protocol ChannelsViewProtocol: class {
    var presenter: ChannelsPresenterProtocol? { get set }
}

// MARK:- Presenter protocols
// MARK: View -> Presenter
protocol ChannelsPresenterProtocol: class {
    var view: ChannelsViewProtocol? { get set }
    var interactor: ChannelsInteractorInputProtocol? { get set }
    var wireFrame: ChannelsWireFrameProtocol? { get set }
    
    func viewLoaded()

}

// MARK: Interactor -> Presenter
protocol ChannelsInteractorOutputProtocol: class {
    
}

// MARK:- Interactor Protocols
// MARK: Presenter -> Interactor
protocol ChannelsInteractorInputProtocol: class {
    var presenter: ChannelsInteractorOutputProtocol? { get set }
    func loadChannels() 

}

// MARK:- Wireframe Protocols
protocol ChannelsWireFrameProtocol: class {
    static func createChannelsView() -> ChannelsView
}

