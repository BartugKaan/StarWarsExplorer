//
//  CharacterListViewModel.swift
//  StarWarsExplorer
//
//  Created by Bartuğ Kaan Çelebi on 16.01.2025.
//

import Foundation

class CharacterListViewModel {
    var characters: [Character] = []
    
    var onDataFetched: (() -> Void)?
    
    func fetchCharacters() {
        NetworkManager.shared.fetch(urlString: "https://swapi.dev/api/people/") { (result: Result<CharacterResponse, Error>) in
            switch result {
            case .success(let response):
                self.characters = response.results
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
