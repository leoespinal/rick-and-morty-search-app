//
//  CharacterDetailViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Leo Espinal on 2/6/25.
//

import XCTest
@testable import RickAndMorty

final class CharacterDetailViewModelTests: XCTestCase {
    func testFormattedCharacterCreationDate() {
        let characterCreationDate = ISO8601DateFormatter.formatterWithFractionalSeconds.date(from: "2017-11-04T18:48:46.250Z")!
        let viewModel = CharacterDetailViewModel(
            character: Character(
                id: 1,
                name: "Rick Sanchez",
                status: "Alive",
                species: "Human",
                type: "",
                created: characterCreationDate,
                image: URL(string: "https://rickandmortyapi.com/api/character/1")!,
                origin: CharacterOrigin(name: "Earth (C-137)")
            )
        )
        let expectedFormattedDate = DateFormatter.longDateShortTimeFormat.string(from: characterCreationDate)
        XCTAssertEqual(
            viewModel.characterCreationDate,
            expectedFormattedDate
        )
    }
}
