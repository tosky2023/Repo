//
//  NetworkManager.swift
//  H4XOR
//
//  Created by 潘鹤群 on 2023/4/7.
//

import Foundation

class NetworkManger {
    
    var posts = [Post]()
    
    func fetchData()  {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                           let results = try decoder.decode(Results.self, from: safeData)
                            Post
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
