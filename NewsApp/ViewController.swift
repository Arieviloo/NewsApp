//
//  ViewController.swift
//  NewsApp
//
//  Created by Jadiê on 18/05/23.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    var listNews: NewsTableView?
    
    private var articles = [Article]()
    private var cellsModel = [NewsTableViewCellViewModel]()
    
    override func loadView() {
        listNews = NewsTableView()
        listNews?.configProtocolosTableView(delegate: self, dataSouce: self)
        view = listNews
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        listNews?.tableView.frame = view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        APICaller.shared.getTopStories { [weak self] result in
            switch result {
            case .success(let articles) :
                self?.articles = articles
                self?.cellsModel = articles.compactMap({
                    NewsTableViewCellViewModel(title: $0.title, subtitle: $0.description ?? "No Desc", imageURL: URL(string: $0.urlToImage ?? ""))
                })
                DispatchQueue.main.async {
                    self?.listNews?.tableView.reloadData()
                }

                print("deu bom \(articles.count)")
              
            case .failure(let error) :
                print("deu ruim")
                print(error)
            }
            
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell
        cell?.configure(with: cellsModel[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listNews?.tableView.deselectRow(at: indexPath, animated: true)
        let article = articles[indexPath.row]
        
        guard let url = URL(string: article.url ?? "") else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
