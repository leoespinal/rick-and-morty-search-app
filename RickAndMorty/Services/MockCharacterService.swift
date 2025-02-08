//
//  MockCharacterService.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//
import Foundation

/// A service to be used by SwiftUI view previews and unit tests
class MockCharacterService: CharacterServiceable {
    static let shared = MockCharacterService()
    var result: Result<[RickAndMortyCharacter], Error> = .success([])
    
    var mockCharacters: [RickAndMortyCharacter] {
        [
            RickAndMortyCharacter(
                id: 1,
                name: "Rick Sanchez",
                status: "Alive",
                species: "Human",
                type: "",
                created: ISO8601DateFormatter.formatterWithFractionalSeconds.date(from: "2017-11-04T18:48:46.250Z")!,
                image: URL(string: "https://rickandmortyapi.com/api/character/1")!,
                origin: CharacterOrigin(name: "Earth (C-137)")
            ),
            RickAndMortyCharacter(
                id: 2,
                name: "Morty Smith",
                status: "Alive",
                species: "Human",
                type: "",
                created: ISO8601DateFormatter.formatterWithFractionalSeconds.date(from: "2017-11-04T18:48:46.250Z")!,
                image: URL(string: "https://rickandmortyapi.com/api/character/1")!,
                origin: CharacterOrigin(name: "Unknown ")
            )
        ]
    }

    // MARK: - Initializers
    private init() {}

    // MARK: - CharacterServicable
    func fetchCharacters(
        by name: String,
        status: CharacterStatusFilterOption = .none,
        species: CharacterSpeciesFilterOption = .none,
        type: CharacterTypeFilterOption = .none
    ) async throws -> [RickAndMortyCharacter] {
        switch result {
        case .success(_):
            return mockCharacters
        case .failure(let error):
            throw error
        }
    }
}
