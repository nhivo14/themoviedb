//
//  FeedCollectionTableViewCell.swift
//  NetflixClone
//
//  Created by NhiVHY on 28/01/2024.
//

import UIKit

class FeedCollectionTableViewCell: UITableViewCell {

    static let identifier = "FeedCollectionTableViewCell"
    
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
    
//    MARK: - Functions
    private func setupUI() {
        contentView.backgroundColor = .systemPink
        contentView.addSubview(moviesCollectionView)
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        moviesCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
}

extension FeedCollectionTableViewCell: UICollectionViewDelegate {
    
}

extension FeedCollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    
}
