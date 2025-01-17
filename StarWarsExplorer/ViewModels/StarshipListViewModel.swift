//
//  StarshipListViewModel.swift
//  StarWarsExplorer
//
//  Created by Bartuğ Kaan Çelebi on 17.01.2025.
//

import Foundation

class StarshipListViewModel{
    var starships: [Starship] = []
    var nextPageUrl: String? = "https://swapi.dev/api/starships/"
    var isLoading = false
    
    var onDataFetched: (() -> Void)?
    
    func fetchStarships(){
        guard !isLoading, let nextPageUrl = nextPageUrl else { return }
        isLoading = true
        
        NetworkManager.shared.fetch(urlString: nextPageUrl) { (result: Result<StarshipResponse, Error>) in
            self.isLoading = false
            switch result{
            case .success(let response):
                self.starships.append(contentsOf: response.results)
                self.nextPageUrl = response.next
                self.onDataFetched?()
            case .failure(let error):
                print("Error fetching starships: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection() -> Int{
        return starships.count
    }
    
    func character(at index:Int) -> Starship{
        return starships[index]
    }
}
