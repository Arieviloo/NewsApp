//
//  APICaller.swift
//  NewsApp
//
//  Created by Jadiê on 18/05/23.
//

import Foundation

final class APICaller {
    
    let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=US&apiKey=eda6154a62744b7bbad849130a7f7b6f")
    
    public func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = topHeadlinesURL else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data else {
                print("error \(#function) -> \(String(describing: error)) ")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("error statusCode \(#function) -> \(String(describing: error)) ")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(APIResponse.self, from: data)
                print("Aqui oh: \(result.articles)")
                completion(.success(result.articles))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
