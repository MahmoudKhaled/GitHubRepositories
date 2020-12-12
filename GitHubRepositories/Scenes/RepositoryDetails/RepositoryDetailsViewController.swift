//
//  RepositoryDetailsViewController.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/12/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {

    @IBOutlet var mainView: RepositoryDetailsView!
    
    //MARK:- viewModel
    private var viewModel: RepositoryDetailsViewModelProtocol?
    func setViewModel(_ viewModel: RepositoryDetailsViewModelProtocol?) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupListAdapter()
        setupUI()
    }
    
    func setupUI() {
        viewModel?.getDetails()
        
        viewModel?.detailsData.binding {  [weak self] _ in
            guard let self = self else { return }
            self.mainView.detailsTableView.reloadData()
        }
        
        viewModel?.repository.binding { [weak self] repository in
            guard let self = self else { return }
            self.mainView.setRepositoryData(repository: repository)
        }
    }
}

extension RepositoryDetailsViewController: UITableViewDataSource {
    
    private func setupListAdapter() {
        mainView.detailsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOFDetailsDataRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RepositoryDetailsTableViewCellTableViewCell.instance(tableView)
        cell.details = viewModel?.getDetailsItem(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60

    }
}
