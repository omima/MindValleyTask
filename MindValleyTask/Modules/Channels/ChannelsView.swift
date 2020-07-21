//
//  ChannelsView.swift
//  Parent
//
//  Created by Omima on 2020.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation
import UIKit

class ChannelsView: UIViewController {
    
    // MARK:- Constants
    struct Constants {
        static let cellIdentifier = "ChannelTableViewCell"
    }
    
    // MARK:- Properties
    var presenter: ChannelsPresenterProtocol?
    
    // MARK: Outlets
    @IBOutlet var tableView: UITableView!
    
    // MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
        registerCell()

    }
    // MARK:- Methods
    // MARK: Public Methods
    
    // MARK: Private Methods
    fileprivate func registerCell(){
        let channelCell = UINib(nibName: Constants.cellIdentifier, bundle:nil)
        tableView.register(channelCell, forCellReuseIdentifier: Constants.cellIdentifier)
    }
    // MARK: Actions
}

// MARK:- ChannelsViewProtocol
extension ChannelsView: ChannelsViewProtocol {
    
}

extension ChannelsView: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as! ChannelTableViewCell
        return cell
    }
    
}
