//
//  RepositoriesViewController.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/10/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

extension RepositoriesViewController {
    static func create() -> UIViewController {
        let vc = self.instance(.main)
        let viewModel = RepositoriesViewModel(repo: RepositoriesRepo(), navigator: RepositoryNavigator(vc))
        vc.setViewModel(viewModel)
        vc.title = ScreenTitle.publicRepositories.title
        return vc
    }
}

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
        setlistAdapter()
        setSearchAdapter()
        setupUI()
    }
    
    private func setupUI() {
        viewModel?.getReposotries()
        
        viewModel?.repositories.binding { [weak self] repositories in
            guard let self = self else { return }
            self.mainView.repositoriesTableView.reloadTableView()
        }
        
        viewModel?.errorMessage.binding { [weak self] message in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showErrorAlert(with: message)
            }
            
        }
    }
}

extension RepositoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    private func setlistAdapter() {
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let numberOfRows = viewModel?.numberOfRepositoriesRows else  { return }
        
        if indexPath.row == numberOfRows - 1 {
            viewModel?.loadNextPage()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectRepository(at: indexPath)
    }
}

extension RepositoriesViewController: UISearchBarDelegate {
    
    func setSearchAdapter() {
        mainView.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel?.searchByRepositoryName(name: searchText)
    }
}
