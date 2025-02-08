//
//  CharacterGridItem.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//
import SwiftUI

struct CharacterGridItem: View {
    private enum Constants {
        static let horizontalStackSpacing: CGFloat = 16
        static let verticalStackSpacing: CGFloat = 2
        static let imageHeight: CGFloat = 200
        static let placeholderForegroundColorOpacity: CGFloat = 0.5
    }
    let character: RickAndMortyCharacter
    
    init(character: RickAndMortyCharacter) {
        self.character = character
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.horizontalStackSpacing) {
            AsyncImage(url: character.image) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: Constants.imageHeight)
            } placeholder: {
                Rectangle()
                    .frame(height: Constants.imageHeight)
                    .foregroundStyle(
                        Color.secondary.opacity(Constants.placeholderForegroundColorOpacity)
                    )
            }
            
            VStack(alignment: .leading, spacing: Constants.verticalStackSpacing) {
                Text(character.name)
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.leading)
                Text(character.species)
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }
        }
        .accessibilityAddTraits(.isButton)
        .accessibilityIdentifier("CharacterGridItem")
    }
}

#Preview {
    CharacterGridItem(
        character: RickAndMortyCharacter(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            type: "",
            created: Date(),
            image: URL(string: "https://rickandmortyapi.com/api/character/1")!,
            origin: CharacterOrigin(name: "Earth (C-137)")
        )
    )
}
