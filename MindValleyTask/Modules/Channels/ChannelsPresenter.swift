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

}

// MARK:- ChannelsPresenterProtocol
extension ChannelsPresenter: ChannelsPresenterProtocol {
    
}

// MARK:- ChannelsInteractorOutputProtocol
extension ChannelsPresenter: ChannelsInteractorOutputProtocol {
    
}
