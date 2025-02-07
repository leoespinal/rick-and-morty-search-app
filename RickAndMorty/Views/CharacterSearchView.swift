//
//  CharacterSearchView.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//

import SwiftUI

struct CharacterSearchView: View {
    @StateObject var viewModel = CharacterSearchViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                VStack {
                    if viewModel.characters.isEmpty {
                        CharacterSearchEmptyStateView()
                    } else {
                        if viewModel.isSearching {
                            ProgressView()
                        } else {
                            CharacterGridView(viewModel: viewModel)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                FilterGroupView(viewModel: viewModel)
            }
            .navigationTitle(Text("Character Search"))
        }
        .searchable(text: $viewModel.searchText)
    }
}

#Preview {
    CharacterSearchView()
}

