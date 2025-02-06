//
//  CharacterServiceTests.swift
//  RickAndMortyTests
//
//  Created by Leo Espinal on 2/6/25.
//

import XCTest
@testable import RickAndMorty

final class CharacterServiceTests: XCTestCase {
    func testFetchCharacters() async {
        let serviceUnderTest = MockCharacterService.shared
        let expectation = XCTestExpectation(description: "Fetch characters from the Rick and Morty API")

        Task {
            let characters = try await serviceUnderTest.fetchCharacters(by: "R")

            XCTAssertFalse(characters.isEmpty, "Characters should not be empty.")
            XCTAssertEqual(characters.count, 2, "There should be 2 characters.")
            XCTAssertEqual(characters[0].name, "Rick Sanchez", "First character is Rick.")

            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 2.0)
    }
}
