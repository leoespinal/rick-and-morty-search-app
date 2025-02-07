//
//  CharacterInfoTextStackView.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//

import SwiftUI

struct CharacterInfoTextStackView: View {
    let title: String
    let subtitle: String
    let accessibilityIdentifier: String
    
    init(title: String, subtitle: String, accessibilityIdentifier: String) {
        self.title = title
        self.subtitle = subtitle
        self.accessibilityIdentifier = accessibilityIdentifier
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            Text(subtitle)
                .font(.title3)
                .bold()
                .accessibilityIdentifier(accessibilityIdentifier)
        }
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    CharacterInfoTextStackView(title: "Species", subtitle: "Humanoid", accessibilityIdentifier: "")
}
