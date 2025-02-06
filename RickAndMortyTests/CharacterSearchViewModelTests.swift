//
//  CharacterSearchViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Leo Espinal on 2/6/25.
//

import XCTest
@testable import RickAndMorty

final class CharacterSearchViewModelTests: XCTestCase {
    func testHandleSearch() async {
        let viewModel = CharacterSearchViewModel(characterService: MockCharacterService.shared)
        XCTAssertFalse(viewModel.isSearching)
        viewModel.searchText = "L"
        XCTAssertTrue(viewModel.isSearching)
        
        viewModel.searchText = ""
        XCTAssertFalse(viewModel.isSearching)
        XCTAssertEqual(viewModel.characters, [])
        
        let expectation = expectation(description: "Characters are fetched")
        
        viewModel.searchText = "Rick"

        // Waiting a second for the mock API call to complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 2.0)
        
        XCTAssertEqual(viewModel.characters, MockCharacterService.shared.mockCharacters)
    }
}
