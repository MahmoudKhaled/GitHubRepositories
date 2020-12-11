//
//  RepositoriesViewController.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/10/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController {
    
    @IBOutlet var mainView: RepositoriesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

extension RepositoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        mainView.repositoriesTableView.dataSource = self
        mainView.repositoriesTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RepositoryTableViewCell.instance(tableView, identifier: RepositoryTableViewCell.identifier)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
