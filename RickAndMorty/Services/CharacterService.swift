//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//
import Foundation

protocol CharacterServicable {
    func fetchCharacters(by name: String) async throws -> [Character]
}

public class CharacterService: CharacterServicable {
    enum CharacterNetworkError: Error {
        case invalidURL
        case invalidHttpResponse
        case fetchError(Error)
    }
    private enum Constants {
        static let endpoint = "https://rickandmortyapi.com/api/character"
        static let validHTTPStatusCode = 200
        static let nameQueryParameterKey = "name"
    }
    static let shared = CharacterService()
    
    // MARK: - Initializers
    private init() {}
    
    // MARK: - CharacterServicable
    func fetchCharacters(by name: String) async throws -> [Character] {
        let nameQueryItem = URLQueryItem(name: Constants.nameQueryParameterKey, value: name)
        var urlComponents = URLComponents(string: Constants.endpoint)
        urlComponents?.queryItems = [nameQueryItem]
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
