//
//  SearchViewController.swift
//  TheMovie
//
//  Created by NhiVHY on 06/02/2024.
//

import UIKit

class SearchViewController: UIViewController {
    
//    MARK: - UI Items
    private let searchTableView: UITableView = {
        let tableview = UITableView()
        tableview.separatorStyle = .singleLine
        return tableview
    }()
    
    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultViewController())
        controller.searchBar.placeholder = "Enter a movie or a TV show"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    
//    MARK: - Properties
    private let viewModel = DiscoverViewModel()
    
//    MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchTableView.frame = view.bounds
    }
    
//    MARK: - UI Configuration
    private func setupUI() {
        title = "Search"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .systemCyan
        navigationItem.searchController = searchController
        
        searchTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.identifier)
        searchTableView.dataSource = self
        searchTableView.delegate = self
        
        view.addSubview(searchTableView)
        
    }
    
//    MARK: - Data Configuration
    private func fetchData() {
        viewModel.fetchDiscoverMovies { [weak self] in
            DispatchQueue.main.async {
                self?.searchTableView.reloadData()
            }
        }
    }
    
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getDiscoverMovies().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        let discoverMovies = viewModel.getDiscoverMovies()
        cell.configureData(movie: discoverMovies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}
