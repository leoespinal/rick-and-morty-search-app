//
//  Filters.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//

enum CharacterStatusFilterOption: String, CaseIterable {
    case alive
    case dead
    case unknown
    case none
}

// There are more but for the purposes of this challenge I'm just adding a few
enum CharacterSpeciesFilterOption: String, CaseIterable {
    case human = "Human"
    case humanoid = "Humanoid"
    case alien = "Alien"
    case robot = "Robot"
    case none
}

// There are more but for the purposes of this challenge I'm just adding a few
enum CharacterTypeFilterOption: String, CaseIterable {
    case planet = "Planet"
    case spaceStation = "Space station"
    case ricksToxicSide = "Rick's Toxic Side"
    case none
}
