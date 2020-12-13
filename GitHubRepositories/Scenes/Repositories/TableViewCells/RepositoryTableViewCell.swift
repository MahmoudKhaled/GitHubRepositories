//
//  RepositoryTableViewCell.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet private weak var repositoryImageView: RemoteImageView!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var repositoryOwnerNameLabel: UILabel!
    @IBOutlet private weak var createdAtLabel: UILabel!
    
    var repository: Repository? {
        didSet {
            guard let repository = repository else { return }
            repositoryImageView.url = repository.owner.avatarImage
            repositoryNameLabel.text = repository.name
            repositoryOwnerNameLabel.text = repository.owner.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        repositoryImageView.image = nil
    }
}
