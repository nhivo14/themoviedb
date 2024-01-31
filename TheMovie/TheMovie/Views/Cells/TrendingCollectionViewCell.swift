//
//  TrendingCollectionViewCell.swift
//  TheMovie
//
//  Created by NhiVHY on 31/01/2024.
//

import UIKit
import SDWebImage

class TrendingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TrendingCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    private func setupUI() {
        addSubview(posterImageView)
    }
    
    func configData(with path: String) {
        let url = URL(string: Constants.baseURLImage + path)
        posterImageView.sd_setImage(with: url)
    }
    
}
