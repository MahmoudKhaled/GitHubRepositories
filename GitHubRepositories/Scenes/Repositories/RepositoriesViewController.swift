//
//  RepositoriesViewController.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/10/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController {
    //MARK:- Outlet of mainView
    @IBOutlet var mainView: RepositoriesView!
    
    //MARK:- viewModel
    private var viewModel: RepositoriesViewModelProtocol?
    func setViewModel(_ viewModel: RepositoriesViewModelProtocol?) {
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
    }
    
    private func setupUI() {
        viewModel?.getReposotries()
        
        viewModel?.repositories.binding { [weak self] repositories in
            guard let self = self else { return }
            self.mainView.repositoriesTableView.reloadTableView()
        }
    }
}

extension RepositoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        mainView.repositoriesTableView.dataSource = self
        mainView.repositoriesTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRepositoriesRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RepositoryTableViewCell.instance(tableView, identifier: RepositoryTableViewCell.identifier)
        cell.repository = viewModel?.getRepositoryItem(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
