//
//  Character.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//
import Foundation

struct CharacterResponse: Decodable {
    let results: [Character]
}

struct CharacterOrigin: Decodable, Hashable {
    let name: String
}

struct Character: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let created: Date
    let image: URL
    let origin: CharacterOrigin
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case status
        case species
        case type
        case created
        case image
        case origin
    }
    
    // MARK: - Initializers
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(String.self, forKey: .status)
        self.species = try container.decode(String.self, forKey: .species)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        let dateString = try container.decode(String.self, forKey: .created)
        if let date = ISO8601DateFormatter.formatterWithFractionalSeconds.date(from: dateString) {
            created = date
        } else {
            throw DecodingError.dataCorruptedError(forKey: .created, in: container, debugDescription: "Invalid date format")
        }
        self.image = try container.decode(URL.self, forKey: .image)
        self.origin = try container.decode(CharacterOrigin.self, forKey: .origin)
    }
    
    init(id: Int,
         name: String,
         status: String,
         species: String,
         type: String? = nil,
         created: Date,
         image: URL,
         origin: CharacterOrigin) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.created = created
        self.image = image
        self.origin = origin
    }
}
