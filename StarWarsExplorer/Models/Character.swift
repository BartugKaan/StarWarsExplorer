//
//  Character.swift
//  StarWarsExplorer
//
//  Created by Bartuğ Kaan Çelebi on 16.01.2025.
//

import Foundation

struct Character: Decodable {
    let name: String?
    let height: String?
    let mass: String?
    let hairColor: String?
    let skinColor: String?
    let eyeColor: String?
    let birthYear: String?
    let gender: String?
    let homeworld: String?
    let films: [String]?
    let species: [String]?
    let vehicles: [String]?
    let starships: [String]?
    let created: String?
    let edited: String?
    let url: String?
    
    var imageUrl: String?{
        guard let url = url else { return nil }
        let id = url.split(separator: "/").last ?? ""
        return "https://starwars-visualguide.com/assets/img/characters/\(id).jpg"
    }

    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
        case homeworld
        case films
        case species
        case vehicles
        case starships
        case created
        case edited
        case url
    }
}

