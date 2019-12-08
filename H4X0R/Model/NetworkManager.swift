//
//  NetworkManager.swift
//  H4X0R
//
//  Created by Usama Sadiq on 11/23/19.
//  Copyright © 2019 Usama Sadiq. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts = [Post]()
    
    func fetchData(){
        
        if let url  = URL(string: "http://hn.algolia.com/api/v1/search?query=bar&restrictSearchableAttributes=url"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeData = data {
                        do{
                            let result = try decoder.decode(Result.self, from: safeData)
                            DispatchQueue.main.async {
                                 self.posts = result.hits
                            }
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
