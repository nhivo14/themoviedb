//
//  FeedCollectionTableViewCell.swift
//  NetflixClone
//
//  Created by NhiVHY on 28/01/2024.
//

import UIKit

enum MediaTypes {
    case movie
    case tv
}

class FeedCollectionTableViewCell: UITableViewCell {

    static let identifier = "FeedCollectionTableViewCell"
    
    private var movies:[Movie] = [Movie]()
    private var tvs: [Tv] = [Tv]()
    private var type: MediaTypes = .movie
    
//    MARK: - UI Items
    private let moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionview
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        moviesCollectionView.frame = contentView.bounds
    }
    
//    MARK: - UI Configuration
    private func setupUI() {
        contentView.backgroundColor = .systemPink
        contentView.addSubview(moviesCollectionView)
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        moviesCollectionView.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: TrendingCollectionViewCell.identifier)
    }
    
//    MARK: - Data Configuration
    func configureData<T>(type: MediaTypes, data: T) {
        self.type = type
        switch type {
        case .movie:
            self.movies = data as! [Movie]
            DispatchQueue.main.async { [weak self] in
                self?.moviesCollectionView.reloadData()
            }
        case .tv:
            self.tvs = data as! [Tv]
            DispatchQueue.main.async { [weak self] in
                self?.moviesCollectionView.reloadData()
            }
        }
    }

}

// MARK: - UICollectionViewDelegate
extension FeedCollectionTableViewCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension FeedCollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.type {
        case .movie :
            return self.movies.count
        case .tv:
            return self.tvs.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCollectionViewCell.identifier, for: indexPath) as? TrendingCollectionViewCell  else { return UICollectionViewCell() }
        switch self.type {
        case .movie:
            cell.configData(with: movies[indexPath.row].poster_path ?? "Check")
        case .tv:
            cell.configData(with: tvs[indexPath.row].poster_path ?? "Check")
        }
        return cell
    }
    
    
}
