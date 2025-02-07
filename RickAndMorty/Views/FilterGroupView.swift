//
//  FilterGroupView.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//

import SwiftUI

struct FilterGroupView: View {
    private enum Constants {
        static let height: CGFloat = 100
    }
    @ObservedObject var viewModel: CharacterSearchViewModel

    var body: some View {
        HStack(alignment: .center, spacing: .zero) {
            FilterButtonView(
                title: "Status",
                accessibilityLabel: "Status filter",
                options: CharacterStatusFilterOption.allCases,
                selection: $viewModel.selectedStatusFilter
            )
            FilterButtonView(
                title: "Species",
                accessibilityLabel: "Species filter",
                options: CharacterSpeciesFilterOption.allCases,
                selection: $viewModel.selectedSpeciesFilter
            )
            FilterButtonView(
                title: "Type",
                accessibilityLabel: "Type filter",
                options: CharacterTypeFilterOption.allCases,
                selection: $viewModel.selectedTypeFilter
            )
        }
        .frame(height: Constants.height)
        .background(Color.black)
    }
}

struct FilterButtonView<T: Hashable & Equatable>: View {
    let title: String
    let accessibilityLabel: String
    let options: [T]
    @Binding var selection: T

    var body: some View {
        VStack(alignment: .center, spacing: .zero) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .accessibilityLabel(Text(accessibilityLabel))
                .dynamicTypeSize(.xSmall ... .xxxLarge)
            MenuPicker(tintColor: .white, options: options, selection: $selection)
        }
        .frame(maxWidth: .infinity)
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    FilterGroupView(
        viewModel: CharacterSearchViewModel(
            characterService: MockCharacterService.shared
        )
    )
}
