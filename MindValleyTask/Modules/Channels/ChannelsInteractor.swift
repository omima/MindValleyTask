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
    var APIDataManager: ChannelsAPIDataManagerInputProtocol?

}

// MARK:- ChannelsInteractorInputProtocol
extension ChannelsInteractor: ChannelsInteractorInputProtocol {
        
}
