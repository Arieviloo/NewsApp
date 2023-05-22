//
//  ViewController.swift
//  NewsApp
//
//  Created by Jadiê on 18/05/23.
//

import UIKit

class ViewController: UIViewController {
    
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
