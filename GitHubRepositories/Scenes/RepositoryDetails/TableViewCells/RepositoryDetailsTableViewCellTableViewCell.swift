//
//  RepositoryDetailsTableViewCellTableViewCell.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/12/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

class RepositoryDetailsTableViewCellTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var detailsIconImageView: BaseImageView!
    @IBOutlet private weak var detailsTitleLabel: UILabel!
    @IBOutlet private weak var detailsValueLabel: UILabel!
    
    var details: RepositoryDetails? {
        didSet {
            guard let details = details else { return }
            detailsIconImageView.image = UIImage(named: details.detailsData.iconTitle)
            detailsTitleLabel.text = details.detailsData.titleValue
            detailsValueLabel.text = details.value
        }
    }
}
