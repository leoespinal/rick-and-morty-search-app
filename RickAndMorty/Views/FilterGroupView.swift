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
            VStack(spacing: .zero) {
                Text("Status")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .padding(.zero)
                    .accessibilityHidden(true)
                Picker("Status Filter", selection: $viewModel.selectedStatusFilter) {
                    ForEach(CharacterStatusFilterOption.allCases, id: \.self) { option in
                        Text(option.rawValue)
                            .tag(option)
                    }
                }
                .pickerStyle(.automatic)
                .tint(.white)
            }
            .frame(maxWidth: .infinity)
            .accessibilityElement(children: .combine)

            VStack(spacing: .zero) {
                Text("Species")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .accessibilityHidden(true)
                Picker("Species Filter", selection: $viewModel.selectedSpeciesFilter) {
                    ForEach(CharacterSpeciesFilterOption.allCases, id: \.self) { option in
                        Text(option.rawValue)
                            .tag(option)
                    }
                }
                .pickerStyle(.automatic)
                .tint(.white)
            }
            .frame(maxWidth: .infinity)
            .accessibilityElement(children: .combine)

            VStack(alignment: .center, spacing: .zero) {
                Text("Type")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .accessibilityHidden(true)
                Picker("Type Filter", selection: $viewModel.selectedTypeFilter) {
                    ForEach(CharacterTypeFilterOption.allCases, id: \.self) { option in
                        Text(option.rawValue)
                            .tag(option)
                    }
                }
                .pickerStyle(.automatic)
                .tint(.white)
            }
            .frame(maxWidth: .infinity)
            .accessibilityElement(children: .combine)
        }
        .frame(height: Constants.height)
        .background(Color.black)
    }
}

#Preview {
    FilterGroupView(
        viewModel: CharacterSearchViewModel(
            characterService: MockCharacterService.shared
        )
    )
}
