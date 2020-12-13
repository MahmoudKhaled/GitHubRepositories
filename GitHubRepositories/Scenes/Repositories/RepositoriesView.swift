//
//  RepositoriesView.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

class RepositoriesView: UIView {
    
    //MARK:- Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var repositoriesTableView: UITableView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        registerRespositoryCell()
        repositoriesTableView.tableFooterView = UIView()
    }
    
    private func registerRespositoryCell() {
        repositoriesTableView.register(RepositoryTableViewCell.nib, forCellReuseIdentifier: RepositoryTableViewCell.identifier)
    }

}
