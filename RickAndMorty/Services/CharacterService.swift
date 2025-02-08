//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//
import Foundation

protocol CharacterServiceable {
    func fetchCharacters(
        by name: String,
        status: CharacterStatusFilterOption,
        species: CharacterSpeciesFilterOption,
        type: CharacterTypeFilterOption
    ) async throws -> [RickAndMortyCharacter]
}

public class CharacterService: CharacterServiceable {
    enum CharacterNetworkError: Error {
        case invalidURL
        case invalidHttpResponse
        case fetchError(Error)
    }
    private enum Constants {
        static let endpoint = "https://rickandmortyapi.com/api/character"
        static let validHTTPStatusCode = 200
        static let nameQueryParameterKey = "name"
        static let statusQueryParameterKey = "status"
        static let speciesQueryParameterKey = "species"
        static let typeQueryParameterKey = "type"
    }
    static let shared = CharacterService()
    
    // MARK: - Initializers
    private init() {}
    
    // MARK: - CharacterServicable
    func fetchCharacters(
        by name: String,
        status: CharacterStatusFilterOption,
        species: CharacterSpeciesFilterOption,
        type: CharacterTypeFilterOption
    ) async throws -> [RickAndMortyCharacter] {
        let nameQueryItem = URLQueryItem(name: Constants.nameQueryParameterKey, value: name)
        var urlComponents = URLComponents(string: Constants.endpoint)
        urlComponents?.queryItems = [nameQueryItem]

        if status != .none {
            let statusQueryItem = URLQueryItem(name: Constants.statusQueryParameterKey, value: status.rawValue)
            urlComponents?.queryItems?.append(statusQueryItem)
        }
        
        if species != .none {
            let speciesQueryItem = URLQueryItem(name: Constants.speciesQueryParameterKey, value: species.rawValue)
            urlComponents?.queryItems?.append(speciesQueryItem)
        }
        
        if type != .none {
            let typeQueryItem = URLQueryItem(name: Constants.typeQueryParameterKey, value: type.rawValue)
            urlComponents?.queryItems?.append(typeQueryItem)
        }
        
        guard let url = urlComponents?.url else {
            throw CharacterNetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == Constants.validHTTPStatusCode else {
            throw CharacterNetworkError.invalidHttpResponse
        }
        
        do {
            let responseData = try JSONDecoder().decode(CharacterResponse.self, from: data)
            return responseData.results
        } catch {
            throw CharacterNetworkError.fetchError(error)
        }
    }
}
