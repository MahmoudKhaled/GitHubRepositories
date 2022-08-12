//
//  RepositoryDetailsViewController.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/12/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

extension RepositoryDetailsViewController {
    static func create(fullName: String) -> UIViewController {
        let vc = self.instance(.main)
        let viewModel = RepositoryDetailsViewModel(repositoryFullName: fullName, repo: RepositoryDetailsRepo())
        vc.setViewModel(viewModel)
        vc.title = ScreenTitle.repositoryDetails.title
        return vc
    }
}

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
        
        viewModel?.repository.binding { [weak self] repository in
            guard let self = self else { return }
            self.setRepositoryData(repository: repository)
        }
        
        viewModel?.errorMessage.binding { [weak self] message in
            guard let self = self else { return }
            self.showErrorAlert(with: message)
        }
    }
    
    private func setRepositoryData(repository: Repository) {
        DispatchQueue.main.async { [weak self ] in
            guard let self  = self else { return }
            self.mainView.detailsTableView.reloadData()
            self.mainView.setRepositoryData(repository: repository)
        }
    }
}

extension RepositoryDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    private func setupListAdapter() {
        mainView.detailsTableView.dataSource = self
        mainView.detailsTableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOFDetailsDataRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RepositoryDetailsTableViewCell.instance(tableView, identifier: RepositoryDetailsTableViewCell.identifier)
        cell.details = viewModel?.getDetailsItem(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50

    }
}
