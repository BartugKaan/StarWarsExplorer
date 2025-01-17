//
//  CharacterListViewModel.swift
//  StarWarsExplorer
//
//  Created by Bartuğ Kaan Çelebi on 16.01.2025.
//

import Foundation

class CharacterListViewModel {
    var characters: [Character] = []
    var nextPageURL: String? = "https://swapi.dev/api/people/"
    var isLoading = false
    
    var onDataFetched: (() -> Void)?
    
    func fetchCharacters() {
        guard !isLoading, let nextPageURL = nextPageURL else { return }
        isLoading = true
        
        
        NetworkManager.shared.fetch(urlString: nextPageURL) { (result: Result<CharacterResponse, Error>) in
            self.isLoading = false
            switch result {
            case .success(let response):
                self.characters.append(contentsOf: response.results)
                self.nextPageURL = response.next
                self.onDataFetched?()
            case .failure(let error):
                print("Error fetching characters: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection() -> Int{
        return characters.count
    }
    
    func character(at index:Int) -> Character{
        return characters[index]
    }
    
}
