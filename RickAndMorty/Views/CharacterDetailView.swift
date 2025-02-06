//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//

import SwiftUI

struct CharacterDetailView: View {
    private enum Constants {
        static let imageDimension: CGFloat = 400
        static let characterInfoStackSpacing: CGFloat = 8
        static let placeholderForegroundColorOpacity: CGFloat = 0.5
        static let maximumTitleFontSize: CGFloat = 24
        static let padding: CGFloat = 16
    }
    let viewModel: CharacterDetailViewModel
    
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                AsyncImage(url: viewModel.characterImageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: Constants.imageDimension)
                        .accessibilityHidden(false)
                        .accessibilityIdentifier("\(viewModel.characterName)")
                } placeholder: {
                    Rectangle()
                        .frame(width: Constants.imageDimension, height: Constants.imageDimension)
                        .foregroundStyle(
                            Color.secondary.opacity(Constants.placeholderForegroundColorOpacity)
                        )
                        .accessibilityIdentifier("Placeholder image for \(viewModel.characterName)")
                }
                
                VStack(alignment: .leading, spacing: Constants.characterInfoStackSpacing) {
                    VStack(alignment: .leading) {
                        Text("Species")
                        Text(viewModel.characterSpecies)
                            .font(.title3)
                            .bold()
                            .accessibilityIdentifier("SpeciesTextElement")
                    }
                    .accessibilityElement(children: .combine)

                    VStack(alignment: .leading) {
                        Text("Status")
                        Text(viewModel.characterStatus)
                            .font(.title3)
                            .bold()
                            .accessibilityIdentifier("StatusTextElement")
                    }
                    .accessibilityElement(children: .combine)

                    VStack(alignment: .leading) {
                        Text("Origin")
                        Text(viewModel.characterOrigin)
                            .font(.title3)
                            .bold()
                            .accessibilityIdentifier("OriginTextElement")
                    }
                    .accessibilityElement(children: .combine)
                    
                    if let type = viewModel.characterType, !type.isEmpty {
                        VStack(alignment: .leading) {
                            Text("Type")
                            Text(type)
                                .font(.title3)
                                .bold()
                                .accessibilityIdentifier("TypeTextElement")
                        }
                        .accessibilityElement(children: .combine)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Created on")
                        Text(viewModel.characterCreationDate)
                            .font(.title3)
                            .bold()
                            .accessibilityIdentifier("CharacterCreatedDateTextElement")
                    }
                    .accessibilityElement(children: .combine)
                }
                .padding(Constants.padding)
                
                ShareLink(item: viewModel.characterImageURL) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
                .padding(.leading, Constants.padding)
                
                Spacer()
            }
            .padding(.zero)
        }
        .navigationTitle(viewModel.characterName)
    }
}

#Preview("CharacterDetailView - No type") {
    CharacterDetailView(
        viewModel: CharacterDetailViewModel(
            character: Character(
                id: 1,
                name: "Rick",
                status: "Alive",
                species: "Human",
                type: "",
                created: Date(),
                image: URL(string: "https://rickandmortyapi.com/api/character/1")!,
                origin: CharacterOrigin(name: "Earth (C-137)")
            )
        )
    )
}

#Preview("CharacterDetailView - type") {
    CharacterDetailView(
        viewModel: CharacterDetailViewModel(
            character: Character(
                id: 1,
                name: "Rick",
                status: "Alive",
                species: "Human",
                type: "Test type",
                created: Date(),
                image: URL(string: "https://rickandmortyapi.com/api/character/1")!,
                origin: CharacterOrigin(name: "Earth (C-137)")
            )
        )
    )
}
