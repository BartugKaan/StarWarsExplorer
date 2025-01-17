//
//  StarshipResponse.swift
//  StarWarsExplorer
//
//  Created by Bartuğ Kaan Çelebi on 17.01.2025.
//

import Foundation

struct StarshipResponse: Decodable {
    let results: [Starship]
    let next: String?
    let previous: String?
}
