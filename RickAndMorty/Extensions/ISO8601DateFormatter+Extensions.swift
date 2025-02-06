//
//  ISO8601DateFormatter+Extensions.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//
import Foundation

extension ISO8601DateFormatter {
    static var formatterWithFractionalSeconds: ISO8601DateFormatter {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withFractionalSeconds]
        return dateFormatter
    }
}
