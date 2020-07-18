//
//  ChannelsWireFrame.swift
//  Parent
//
//  Created by Omima on 2020.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation
import UIKit

class ChannelsWireFrame: ChannelsWireFrameProtocol {
	
	// MARK:- Constants
    struct Constants {
        static let storyBoardName: String = "Main"
        static let viewIdentifier: String = "ChannelsView"
    }
    
    // MARK:- Methods
    // MARK:- Public Methods
    static func createChannelsView() -> ChannelsView {
        // Generating module components
        let view = storyBoard.instantiateViewController(withIdentifier: Constants.viewIdentifier) as! ChannelsView
        let presenter: ChannelsPresenterProtocol & ChannelsInteractorOutputProtocol = ChannelsPresenter()
        let interactor: ChannelsInteractorInputProtocol = ChannelsInteractor()
        let apiDataManager: ChannelsAPIDataManagerInputProtocol = ChannelsAPIDataManager()
        let wireFrame: ChannelsWireFrameProtocol = ChannelsWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = apiDataManager
        
        return view
    }
    
    static var storyBoard: UIStoryboard {
        get {
            return UIStoryboard(name: Constants.storyBoardName, bundle: nil)
        }
    }
}
