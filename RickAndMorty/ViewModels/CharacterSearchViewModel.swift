//
//  CharacterSearchViewModel.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//
import Combine
import SwiftUI

final class CharacterSearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var characters: [Character] = []
    @Published var isSearching = false
    private(set) var characterService: CharacterServicable
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initializers
    init(characterService: CharacterServicable = CharacterService.shared) {
        self.characterService = characterService
        setUpSubscriptions()
    }
}

private extension CharacterSearchViewModel {
    func setUpSubscriptions() {
        $searchText
            .sink { [weak self] searchText in
                guard let self else { return }
                handleSearch(using: searchText)
            }
            .store(in: &cancellables)
    }

    func handleSearch(using searchText: String) {
        isSearching = true
        
        guard !searchText.isEmpty else {
            isSearching = false
            /*
             If the search text is empty then the list of Characters
             should be too otherwise they will persist until the next search
            */
            characters = []
            return
        }

        Task {
            do {
                let characters = try await characterService.fetchCharacters(by: searchText)
                await MainActor.run {
                    self.characters = characters
                    self.isSearching = false
                }
            } catch {
                print("Error fetching characters: \(error.localizedDescription)")
                await MainActor.run {
                    self.isSearching = false
                }
            }
        }
    }
}
