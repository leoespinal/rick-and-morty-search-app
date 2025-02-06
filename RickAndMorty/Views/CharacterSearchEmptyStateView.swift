//
//  CharacterSearchEmptyStateView.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//

import SwiftUI

struct CharacterSearchEmptyStateView: View {
    private enum Constants {
        static let emptyStateMessage = "Start by typing the name of a Rick and Morty character"
    }

    var body: some View {
        VStack {
            Spacer()
            Text(Constants.emptyStateMessage)
                .padding()
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.secondary)
            Spacer()
        }
    }
}

#Preview {
    CharacterSearchEmptyStateView()
}
