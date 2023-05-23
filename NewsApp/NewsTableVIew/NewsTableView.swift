//
//  NewsTableView.swift
//  NewsApp
//
//  Created by Jadiê on 23/05/23.
//

import UIKit

class NewsTableView: UIView {
    
    lazy var tableView: UITableView = {
        let tab = UITableView()
        tab.translatesAutoresizingMaskIntoConstraints = false
        tab.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        return tab
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        configSetupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configProtocolosTableView(delegate: UITableViewDelegate, dataSouce: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSouce
    }
    
    private func configSetupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
