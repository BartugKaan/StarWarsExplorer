//
//  NetworkManager.swift
//  StarWarsExplorer
//
//  Created by Bartuğ Kaan Çelebi on 15.01.2025.
//

import Foundation


class NetworkManager{
    static let shared = NetworkManager()//Singelton
    private init(){}
    
    func fetch<T:Decodable>(
        urlString: String,
        completion: @escaping (Result<T,Error>) -> Void
    ){
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error{
                completion(.failure(error))
                return
            }
            
            guard let data = data else{
                completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                return
            }
            
            do{
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            }
            catch{
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
