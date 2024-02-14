//
//  SearchResultViewController.swift
//  TheMovie
//
//  Created by NhiVHY on 06/02/2024.
//

import UIKit

class SearchResultViewController: UIViewController {
//    MARK: - Properties
    private var searchResult: [Movie] = [Movie]()

//    MARK: - UI Items
    private let searchResultCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
//    MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultCollectionView.frame = view.bounds
    }
    
//    MARK: - UI Confiuration
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(searchResultCollectionView)
        
        searchResultCollectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        searchResultCollectionView.delegate = self
        searchResultCollectionView.dataSource = self
    }
    
//    MARK: Data Configuration
    func setupData(result: [Movie]) {
        searchResult = result
        searchResultCollectionView.reloadData()
    }

}

extension SearchResultViewController: UICollectionViewDelegate {
    
}

extension SearchResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configData(with: searchResult[indexPath.row].poster_path)
        return cell
    }
    
    
}
