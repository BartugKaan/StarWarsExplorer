//
//  Starship.swift
//  StarWarsExplorer
//
//  Created by Bartuğ Kaan Çelebi on 17.01.2025.
//

import Foundation

struct Starship: Decodable{
    let name: String?
    let model: String?
    let manufacturer: String?
    let costInCredits: String?
    let length: String?
    let crew: String?
    let passengers: String?
    let maxAtmospheringSpeed: String?
    let hyperdriveRating: String?
    let MGLT: String?
    let cargoCapacity: String?
    let consumables: String?
    let films: [String]? // Will be Film object
    let pilots: [Character]?
    let url: String?
    let edited: String?
    let created: String?
    
    var imageUrl: String? {
        guard let url = url else { return nil }
        let id = url.split(separator: "/").last ?? ""
        return "https://starwars-visualguide.com/assets/img/starships/\(id).jpg"
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case crew
        case passengers
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case hyperdriveRating = "hyperdrive_rating"
        case MGLT
        case cargoCapacity
        case consumables
        case films
        case pilots
        case url
        case edited
        case created
    }
}
