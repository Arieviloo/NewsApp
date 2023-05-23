//
//  NewsTableViewCellViewModelScreen.swift
//  NewsApp
//
//  Created by Jadiê on 23/05/23.
//

import UIKit

class NewsTableViewCellViewModelScreen: UIView {

    lazy var newsTitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = .systemFont(ofSize: 20, weight: .medium)
        lb.numberOfLines = 0
        return lb
    }()
    
    lazy var subtitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = .systemFont(ofSize: 18)
        lb.numberOfLines = 0
        return lb
    }()
    
    lazy var newsImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .systemRed
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(newsImageView)
        addSubview(newsTitleLabel)
        addSubview(subtitleLabel)
        
        configSetupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configSetupConstraints() {
        NSLayoutConstraint.activate([
            newsTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            newsTitleLabel.trailingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: -5),
            newsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            newsTitleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            subtitleLabel.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: 12),  subtitleLabel.trailingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: -5),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 50),

//            newsImageView.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 8),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            
            newsImageView.widthAnchor.constraint(equalToConstant: 150),
            newsImageView.heightAnchor.constraint(equalToConstant: 140),
            
            newsImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
}
