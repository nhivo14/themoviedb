//
//  UpcomingViewController.swift
//  NetflixClone
//
//  Created by NhiVHY on 27/01/2024.
//

import UIKit

class UpcomingViewController: UIViewController {
    
//    MARK: - UI Items
    private let upcomingTableView: UITableView = {
        let tableview = UITableView()
        tableview.separatorStyle = .singleLine
        
        return tableview
    }()
    
//    MARK: - Properties
    private let viewModel = UpcomingViewModel()

//    MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTableView.frame = view.bounds
    }
    
//    MARK: - UI Configuration
    private func setupUI() {
        setupNavBar()
        view.backgroundColor = .systemBackground
        title = "Upcoming"
        view.addSubview(upcomingTableView)
        upcomingTableView.register(UpcomingTableViewCell.self, forCellReuseIdentifier: UpcomingTableViewCell.identifier)
        upcomingTableView.delegate = self
        upcomingTableView.dataSource = self
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
// MARK: - Data Configuration
    private func fetchData() {
        viewModel.fetchUpcomingMovies { [weak self] in
            DispatchQueue.main.async {
                self?.upcomingTableView.reloadData()
            }
        }
    }

}

extension UpcomingViewController: UITableViewDelegate {
    
}

extension UpcomingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getUpcomingMovies().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingTableViewCell.identifier, for: indexPath) as? UpcomingTableViewCell else { return UITableViewCell() }
        let movies = viewModel.getUpcomingMovies()
        cell.configureData(movie: movies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}
