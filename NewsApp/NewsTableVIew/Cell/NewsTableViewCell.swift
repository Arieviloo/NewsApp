//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Jadiê on 23/05/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    static let identifier = "NewsTableViewCell"
    
    private var screen:NewsTableViewCellViewModelScreen = NewsTableViewCellViewModelScreen()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        screen.newsTitleLabel.frame = CGRect(x: 10, y: 0, width: contentView.frame.size.width - 120, height: contentView.frame.size.height/2)
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//    }
    
    public func configure(with viewModel: NewsTableViewCellViewModel) {
        screen.newsTitleLabel.text = viewModel.title
        screen.subtitleLabel.text = viewModel.subtitle
        
        if let data = viewModel.imageData {
            screen.newsImageView.image = UIImage(data: data)
        }
         if let url = viewModel.imageURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async {
                    self?.screen.newsImageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
    

}
