//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//
import Foundation

final class CharacterDetailViewModel {
    private let character: Character
    
    var characterName: String {
        character.name
    }
    
    var characterImageURL: URL {
        character.image
    }
    
    var characterSpecies: String {
        character.species
    }
    
    var characterStatus: String {
        character.status
    }
    
    var characterType: String? {
        character.type
    }
    
    var characterOrigin: String {
        character.origin.name
    }
    
    var characterCreationDate: String {
        return DateFormatter.longDateShortTimeFormat.string(from: character.created)
    }
    
    // MARK: - Initializers
    init(character: Character) {
        self.character = character
    }
}
