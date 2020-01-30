//
//  DataManager.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 11/20/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private var pets: [Pet] = []
    private var petsFiltered: [Pet] = []
    private var matchedPets: [Pet] = []

    private let key = "PetFavourites"
    
    private init() {
        pets = getDataFromJson()
    }
    
    // Retrieve data from all pets
    func getPets() -> [Pet] {
        return pets
    }
    
    // Only get names
    func getNames(for pet: Pet) -> String {
        return pet.name
    }
    
    // Get pets by type (dog/cat)
    func getPets(for type: PetType) -> [Pet] {
        return pets.filter({ $0.type == type})
    }
    
    // Get only adopted/nonadopted pets
    func getAdoptedPets() -> [Pet] {
        return pets.filter({ $0.adopted == "yes"})
    }
    func getNotAdoptedPets() -> [Pet] {
        return pets.filter({ $0.adopted == "no"})
    }
    
    // Getting the pet that was in the shelter the longest
    func getPetLongestInShelter() -> Pet {
        var oldestPet: Pet = pets[0]
        // Setting oldest dates
        var oldestYear: Int = 3000
        var oldestMonth: Int = 13
        var oldestDay: Int = 32
        
        for pet in getNotAdoptedPets() {
            let date: String = pet.arrived
            // Using variables startIndex and endIndex for more clean code
            var startIndex = date.index(date.startIndex, offsetBy: 6) // Yyyy
            var endIndex = date.index(date.startIndex, offsetBy: 9) // yyyY
            
            let currentYear: Int = Int(date[startIndex...endIndex]) ?? 3000 // YYYY
            
            startIndex = date.index(date.startIndex, offsetBy: 3) // Mm
            endIndex = date.index(date.startIndex, offsetBy: 4) // mM
            
            let currentMonth: Int = Int(date[startIndex...endIndex]) ?? 3000 // MM
            
            startIndex = date.index(date.startIndex, offsetBy: 0) // Dd
            endIndex = date.index(date.startIndex, offsetBy: 1) // dD

            let currentDay: Int = Int(date[startIndex...endIndex]) ?? 3000 // DD
            
            // Conditions for finding oldest by checking if the currentOldest is younger than pet
            // If the year is bigger, replace, if it is the same but month is bigger, replace,
            // if they are both the same but day is bigger, replace
            if (oldestYear > currentYear || oldestMonth > currentMonth && oldestYear == currentYear || oldestDay > currentDay && oldestMonth == currentMonth && oldestYear == currentYear) {
                oldestPet = pet
                oldestYear = currentYear
                oldestMonth = currentMonth
                oldestDay = currentDay
            }
        }
        return oldestPet
    }
    
    // Get data from data.json file
    func getDataFromJson() -> [Pet] {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            return []
        }
        
        do {
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: url)
            let decodedData = try decoder.decode([Pet].self, from: data)
            return decodedData
        }
        catch {
            print(error)
        }
        
        return []
    }
    
    // get all favourites
    func getFavouritePets() -> [Pet] {
        let defaults = UserDefaults.standard // default user data
        var favouritePets: [Pet] = [] // array for favourites to be stored in
        
        guard let favourites = defaults.object(forKey: key) as? [String] else {
            return favouritePets
        }
        
        for name in favourites {
            let filteredPets = getPets().filter({$0.name == name})
            favouritePets.append(contentsOf: filteredPets)
        }
        return favouritePets
    }
    
    // add to list of favourite pets
    func addToFavouritePets(pet: Pet) {
        let defaults = UserDefaults.standard
        
        if var favourites = defaults.object(forKey: key) as? [String] {
            if favourites.contains(pet.name) {return} // if already in the favourites array
            favourites.append(pet.name)
            defaults.set(favourites, forKey: key)
        }
        else {
            let favouritePets = [pet.name]
            defaults.set(favouritePets, forKey: key)
        }
    }
    
    // remove from the list of favourite pets
    func removeFromFavouritePets(pet: Pet) {
        let defaults = UserDefaults.standard
        
        if var favourites = defaults.object(forKey: key) as? [String] {
            if let index = favourites.firstIndex(of: pet.name) {
            favourites.remove(at: index) // remove this certain pet
            defaults.set(favourites, forKey: key)
            }
        }
    }
    
    // rearrange the positions of favourite pets
    func rearrangePositionFavouritePets(movePet pet: Pet, to index: Int) {
        let defaults = UserDefaults.standard
        
        if var favourites = defaults.object(forKey: key) as? [String] {
            if let indexToRemove = favourites.firstIndex(of: pet.name) {
                favourites.remove(at: indexToRemove)
                favourites.insert(pet.name, at: index)
                defaults.set(favourites, forKey: key)
            }
        }
    }
    
    // Pet Filters
    func getFiltered() -> [Pet] {
        return petsFiltered
    }
    
    func setFilter(type: Int, breed: String, goodWithKids: Bool, goodWithAnimals: Bool, houseTrained: Bool) {
        if (breed == "Any") {
            petsFiltered = pets.filter({ $0.type.rawValue == type && $0.adopted == "no"})
        } else {
            petsFiltered = pets.filter({ $0.type.rawValue == type && $0.breed == breed && $0.adopted == "no"})
        }
        
        if (goodWithKids) {
            petsFiltered = petsFiltered.filter({$0.likesKids == goodWithKids})
        }
        if (goodWithAnimals) {
            petsFiltered = petsFiltered.filter({$0.likesAnimals == goodWithAnimals})
        }
        if (houseTrained) {
            petsFiltered = petsFiltered.filter({$0.houseTrained == houseTrained})
        }
    }
    
    // Pet Match
    func getMatch() -> [Pet] {
        return matchedPets
    }
    
    func setMatch(likesOutdoors: Int, hasKids: Int, hasPets: Int, hasExtraTime: Int, hasTrainingTime: Int) {
        matchedPets = pets.filter({$0.adopted == "no"})
        var adventurous = false, likesKids = false, likesAnimals = false, playful = false, houseTrained = false
        if (likesOutdoors == 0) {
            adventurous = true
        }
        if(hasKids == 0) {
            likesKids = true
        }
        if(hasPets == 0) {
            likesAnimals = true
        }
        if(hasExtraTime == 0) {
            playful = true
        }
        if(hasTrainingTime == 0) {
            houseTrained = true
        }
        matchedPets = matchedPets.filter({$0.adventurous == adventurous && $0.likesKids == likesKids && $0.likesAnimals == likesAnimals && $0.playful == playful && $0.houseTrained == houseTrained})
        matchedPets.append(pets[0])
    }
    
}


