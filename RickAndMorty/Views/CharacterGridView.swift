//
//  CharacterGridView.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//

import SwiftUI

struct CharacterGridView: View {
    private enum Constants {
        static let portraitModeGridItemScaleFactor: CGFloat = 0.5
        static let landscapeModeGridItemScaleFactor: CGFloat = 0.3
    }
    @ObservedObject var viewModel: CharacterSearchViewModel
    
    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            ScrollView {
                LazyVGrid(columns: isLandscape ? [
                    GridItem(.flexible(maximum: geometry.size.width * Constants.landscapeModeGridItemScaleFactor), spacing: .zero, alignment: .top),
                    GridItem(.flexible(maximum: geometry.size.width * Constants.landscapeModeGridItemScaleFactor), spacing: .zero, alignment: .top),
                    GridItem(.flexible(maximum: geometry.size.width * Constants.landscapeModeGridItemScaleFactor), spacing: .zero, alignment: .top)
                ] : [
                    GridItem(.flexible(maximum: geometry.size.width * Constants.portraitModeGridItemScaleFactor), alignment: .top),
                    GridItem(.flexible(maximum: geometry.size.width * Constants.portraitModeGridItemScaleFactor), alignment: .top)
                ]) {
                    ForEach(viewModel.characters, id: \.id) { character in
                        NavigationLink(value: character) {
                            CharacterGridItem(character: character)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
        }
        .scrollDismissesKeyboard(.immediately)
        .navigationDestination(for: Character.self) { character in
            CharacterDetailView(
                viewModel: CharacterDetailViewModel(
                    character: character
                )
            )
        }
    }
}

#Preview {
    let characterSearchViewModel = CharacterSearchViewModel(characterService: MockCharacterService.shared)
    characterSearchViewModel.searchText = "Rick"
    return CharacterGridView(viewModel: characterSearchViewModel)
}
