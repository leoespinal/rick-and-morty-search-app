//
//  RickAndMortyUITests.swift
//  RickAndMortyUITests
//
//  Created by Leo Espinal on 2/6/25.
//

import XCTest

final class RickAndMortyUITests: XCTestCase {
    private let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    @MainActor
    func testNavigatingToCharacterDetailView() throws {
        // Find the search bar and enter "Rick" as the search term
        let searchField = app.searchFields.firstMatch
        XCTAssertTrue(searchField.exists)
        searchField.tap()
        searchField.typeText("Rick")

        // Tapping on the first cell navigates to the character detail screen for the first character in the search results
        let firstCharacterSearchResultCell = app.buttons["CharacterGridItem"].firstMatch
        firstCharacterSearchResultCell.tap()
        
        // Verifying all expected elements on the character detail screen
        let characterImage = app.images.firstMatch
        XCTAssertTrue(characterImage.exists)
        let speciesText = app.staticTexts.element(matching: .staticText, identifier: "SpeciesTextElement")
        XCTAssertTrue(speciesText.exists)
        let statusText = app.staticTexts.element(matching: .staticText, identifier: "StatusTextElement")
        XCTAssertTrue(statusText.exists)
        let originText = app.staticTexts.element(matching: .staticText, identifier: "OriginTextElement")
        XCTAssertTrue(originText.exists)
        let typeText = app.staticTexts.element(matching: .staticText, identifier: "TypeTextElement")
        XCTAssertFalse(typeText.exists)
        let characterCreatedDateText = app.staticTexts.element(matching: .staticText, identifier: "CharacterCreatedDateTextElement")
        XCTAssertTrue(characterCreatedDateText.exists)
    }
    
    @MainActor
    func testDynamicTypeAccessibilityAudit() throws {
        let searchField = app.searchFields.firstMatch
        XCTAssertTrue(searchField.exists)
        searchField.tap()
        searchField.typeText("Rick")
        
        // Perform the dynamic type audit on the search result grid
        do {
            try app.performAccessibilityAudit(for: .dynamicType)
        } catch {
            XCTFail("Unable to perform dynamic type audit of the character search results")
        }

        let firstCharacterSearchResultCell = app.buttons["CharacterGridItem"].firstMatch
        firstCharacterSearchResultCell.tap()
        
        // Perform the dynamic type audit on the character detail screen
        do {
            try app.performAccessibilityAudit(for: .dynamicType)
        } catch {
            XCTFail("Unable to perform dynamic type audit")
        }
        
        let characterImage = app.images.firstMatch
        XCTAssertTrue(characterImage.exists)

        let speciesText = app.staticTexts["SpeciesTextElement"].firstMatch
        while !speciesText.exists {
            app.swipeDown()
        }
        XCTAssertTrue(speciesText.exists)
        
        let statusText = app.staticTexts["StatusTextElement"].firstMatch
        while !statusText.exists {
            app.swipeDown()
        }
        XCTAssertTrue(statusText.exists)

        let originText = app.staticTexts["OriginTextElement"].firstMatch
        while !originText.exists {
            app.swipeDown()
        }
        XCTAssertTrue(originText.exists)

        let typeText = app.staticTexts["TypeTextElement"].firstMatch
        XCTAssertFalse(typeText.exists)

        let characterCreatedDateText = app.staticTexts["CharacterCreatedDateTextElement"].firstMatch
        while !characterCreatedDateText.exists {
            app.swipeDown()
        }
        XCTAssertTrue(characterCreatedDateText.exists)
    }
}
