//
//  RepositoryDetailsView.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/12/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

class RepositoryDetailsView: UIView {
    
    @IBOutlet private weak var repositoryImageView: BaseImageView!
    @IBOutlet private weak var repositoryOwnerNameLabel: UILabel!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var detailsTableView: UITableView!
    @IBOutlet private weak var repositoryDetailsLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        registerRespositoryCell()
        detailsTableView.tableFooterView = UIView()
    }
    
    private func registerRespositoryCell() {
        detailsTableView.register(RepositoryDetailsTableViewCellTableViewCell.nib, forCellReuseIdentifier: RepositoryDetailsTableViewCellTableViewCell.identifier)
    }
    
    func setRepositoryData(repository: Repository) {
        repositoryImageView.load(url: repository.owner.avatarImage)
        repositoryOwnerNameLabel.text = repository.owner.name
        repositoryNameLabel.text = repository.name
        repositoryDetailsLabel.text = repository.description
    }

}
