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
    @Published var selectedStatusFilter: CharacterStatusFilterOption = .none
    @Published var selectedSpeciesFilter: CharacterSpeciesFilterOption = .none
    @Published var selectedTypeFilter: CharacterTypeFilterOption = .none

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
            .combineLatest($selectedStatusFilter, $selectedSpeciesFilter, $selectedTypeFilter)
            .sink { [weak self] searchText, statusFilter, speciesFilter, typeFilter in
                guard let self else { return }
                handleSearch(using: searchText, statusFilter: statusFilter, speciesFilter: speciesFilter, typeFilter: typeFilter)
            }
            .store(in: &cancellables)
    }

    func handleSearch(using searchText: String, statusFilter: CharacterStatusFilterOption, speciesFilter: CharacterSpeciesFilterOption, typeFilter: CharacterTypeFilterOption) {
        isSearching = true
        
        guard !searchText.isEmpty else {
            resetUI()
            return
        }

        Task {
            do {
                let characters = try await characterService.fetchCharacters(
                    by: searchText,
                    status: statusFilter,
                    species: speciesFilter,
                    type: typeFilter
                )
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

    func resetUI() {
        isSearching = false
        selectedStatusFilter = .none
        selectedSpeciesFilter = .none
        selectedTypeFilter = .none
        /*
         If the search text is empty then the list of Characters
         should be too otherwise they will persist until the next search
        */
        characters = []
    }
}
