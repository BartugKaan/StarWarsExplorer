//
//  CharacterListViewModel.swift
//  StarWarsExplorer
//
//  Created by Bartuğ Kaan Çelebi on 16.01.2025.
//

import Foundation

class CharacterListViewModel {
    var characters: [Character] = []
    
    var onDataFetch: (() -> Void)?
    
    func fetchData(){
        NetworkManager.shared.fetch(urlString: "https://swapi.dev/api/people/") { (result: Result<[Character], Error>) in
            switch result{
            case .success(let characters):
                self.characters = characters
                self.onDataFetch?()
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
