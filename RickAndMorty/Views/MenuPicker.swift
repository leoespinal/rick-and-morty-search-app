//
//  MenuPicker.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/7/25.
//

import SwiftUI

struct MenuPicker<T: Hashable & Equatable>: View {
    let tintColor: Color
    let options: [T]
    @Binding var selection: T

    var body: some View {
        Picker("", selection: $selection) {
            ForEach(options, id: \.self) { option in
                Text("\(option)")
                    .tag(option)
                    // Cleared out accessibility label to prevent duplicate VO readout
                    .accessibilityLabel("")
            }
        }
        .pickerStyle(.menu)
        .tint(tintColor)
        .dynamicTypeSize(.xSmall ... .xxxLarge)
    }
}
