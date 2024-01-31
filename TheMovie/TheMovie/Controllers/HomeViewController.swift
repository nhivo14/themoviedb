//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by NhiVHY on 27/01/2024.
//

import UIKit

class HomeViewController: UIViewController {
//    MARK: - UI Items
    private let homeFeedTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    
//    MARK: - Varibales
    let sectionTitles: [String] = [
        "Top trending",
        "TV shows",
        "Top rated",
        "Upcoming movies"
    ]

//    MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getTrendingMovies()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTableView.frame = view.bounds
    }
    
//    MARK: - UI Configuration
    private func  setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(homeFeedTableView)
        homeFeedTableView.delegate = self
        homeFeedTableView.dataSource = self
        homeFeedTableView.register(FeedCollectionTableViewCell.self, forCellReuseIdentifier: FeedCollectionTableViewCell.identifier)
        
        let headerView = BigHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTableView.tableHeaderView = headerView
        configNavbar()
    }
    
    private func configNavbar() {
        var image = UIImage(named: "logo_dmdb_resize")
        image = image?.withRenderingMode(.alwaysOriginal)
        let logoButton = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        logoButton.width = 30
        navigationItem.leftBarButtonItem = logoButton
        
        let personButton = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil)
        let playingButton = UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            personButton,
            playingButton
        ]
        
        navigationController?.navigationBar.tintColor = .cyan
    }
    
//    MARK: - Data Handling
    private func getTrendingMovies() {
        APIService.shared.getAllTrending { result in
            switch result {
            case .success(let response):
                print(response.results)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

// MARK: - UITableView Delegate
extension HomeViewController: UITableViewDelegate {
    
}

// MARK: - UITableView Datasource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedCollectionTableViewCell.identifier, for: indexPath) as? FeedCollectionTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else {return}
        headerView.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        headerView.textLabel?.frame = CGRect(x: headerView.bounds.origin.x, y: headerView.bounds.origin.y, width: 120, height: headerView.bounds.height)
        headerView.textLabel?.textColor = .systemCyan
        headerView.textLabel?.text = headerView.textLabel?.text?.capitalizeFirstLetter()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
