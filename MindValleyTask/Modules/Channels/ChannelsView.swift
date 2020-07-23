//
//  ChannelsView.swift
//  Parent
//
//  Created by Omima on 2020.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation
import UIKit

class ChannelsView: BaseViewController {
    
    // MARK:- Constants
    struct Constants {
        static let cellIdentifier = "ChannelTableViewCell"
    }
    
    // MARK:- Properties
    var presenter: ChannelsPresenterProtocol?
    
    // MARK: Outlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var footerView: FooterView!
    
    // MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
        registerCell()
        configureTableView()
    }

    
    // MARK: Private Methods
    fileprivate func registerCell(){
        let channelCell = UINib(nibName: Constants.cellIdentifier, bundle:nil)
        tableView.register(channelCell, forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    fileprivate func configureTableView() {
        tableView.tableHeaderView = headerView
        tableView.sizeHeaderToFit()
        
        tableView.tableFooterView = footerView
        footerView.delegte = self
        tableView.sizeFooterToFit()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
}

// MARK:- ChannelsViewProtocol
extension ChannelsView: ChannelsViewProtocol {
    func reloadData() {
        tableView.reloadData()
        tableView.sizeHeaderToFit()
        tableView.sizeFooterToFit()
        
    }
}

extension ChannelsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as! ChannelTableViewCell
        cell.delegate = self
        cell.configureChannel(with: presenter!.getChannelItem(at: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
 
extension ChannelsView: FooterViewDelegate {
    func shouldUpdateViewLayout() {
        tableView.sizeFooterToFit()
    }
}

extension ChannelsView: ChannelCellDelegate {
    func shouldUpadteViewLayout() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
}
