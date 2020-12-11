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
    @IBOutlet weak var repositoryImageView: BaseImageView!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryOwnerNameLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    var repository: Repository? {
        didSet {
            guard let repository = repository else { return }
//            repositoryImageView.setImage(forURL: repository.owner.avatarImage)
            repositoryImageView.load(url: repository.owner.avatarImage)
            repositoryNameLabel.text = repository.name
            repositoryOwnerNameLabel.text = repository.owner.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
