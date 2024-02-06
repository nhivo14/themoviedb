//
//  UpcomingTableViewCell.swift
//  TheMovie
//
//  Created by NhiVHY on 05/02/2024.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    static let identifier = "ItemTableViewCell"
    
//    MARK: - UI Items
    private let posterImageView: UIImageView = {
        let imgageView = UIImageView()
        imgageView.contentMode = .scaleAspectFill
        imgageView.translatesAutoresizingMaskIntoConstraints = false
        imgageView.clipsToBounds = true
        return imgageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
     
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
//    MARK: - UI Configuration
    private func setupUI() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playButton)
        applyconstraints()
        
    }
    
    private func applyconstraints() {
        let posterImageViewConstraints: [NSLayoutConstraint] = [
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant:  10),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            posterImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(posterImageViewConstraints)
        
        let playButtonConstraints: [NSLayoutConstraint] = [
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(playButtonConstraints)
        
        let titleLabelConstraints: [NSLayoutConstraint] = [
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)

    }
    
//     MARK: - Data Configuration
    func configureData(movie: Movie) {
        let url = URL(string: Constants.baseURLImage + (movie.poster_path ?? "N/A"))
        posterImageView.sd_setImage(with: url)
        titleLabel.text = movie.original_title ?? "N/A"
    }
}
