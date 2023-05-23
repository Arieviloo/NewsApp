//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Jadiê on 23/05/23.
//

import Foundation

class NewsTableViewCellViewModel {
    let title: String
    let subtitle: String
    let imageURL: URL?
    let imageData: Data? = nil
    
    init(title: String, subtitle: String, imageURL: URL?) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
    }
}
