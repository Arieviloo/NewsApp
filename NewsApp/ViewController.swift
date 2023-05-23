//
//  ViewController.swift
//  NewsApp
//
//  Created by Jadiê on 18/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    var listNews: NewsTableView?
    
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
        view.backgroundColor = .red
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        APICaller.shared.getTopStories { result in
            switch result {
            case .success(let response) :
                print("deu bom")
                break
            case .failure(let error) :
                print("deu ruim")
                print(error)
            }
            
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "newssss"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listNews?.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
