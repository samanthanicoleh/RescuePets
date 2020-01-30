//
//  PetType.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 11/20/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import Foundation

enum PetType: Int, Codable, CustomStringConvertible {
    case dog = 0
    case cat
    
    var description: String {
        switch self {
            case .dog:
                return "Dog"
            case .cat:
                return "Cat"
        }
    }
    
    
}
