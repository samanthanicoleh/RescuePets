//
//  Pet.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 11/20/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import Foundation

struct Pet: Codable {
    
    let id: Int
    let name: String
    let about: String
    let type: PetType
    let gender: String
    let birthday: String
    let breed: String
    let size: String
    let adopted: String
    let adoptedDesc: String
    let arrived: String

    let playful: Bool
    let likesKids: Bool
    let likesAnimals: Bool
    let adventurous: Bool
    let houseTrained: Bool

    let imageUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case about = "about"
        case type = "type"
        case gender = "gender"
        case birthday = "birthday"
        case breed = "breed"
        case size = "size"
        case adopted = "adopted"
        case adoptedDesc = "adoptedDesc"
        case arrived = "arrived"
        case playful = "playful"
        case likesKids = "likesKids"
        case likesAnimals = "likesAnimals"
        case adventurous = "adventurous"
        case houseTrained = "houseTrained"
        case imageUrl = "imageUrl"
    }
    
    
    
    
}
