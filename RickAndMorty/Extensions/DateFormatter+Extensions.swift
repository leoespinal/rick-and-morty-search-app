//
//  DateFormatter+Extensions.swift
//  RickAndMorty
//
//  Created by Leo Espinal on 2/6/25.
//
import Foundation

extension DateFormatter {
    static var longDateShortTimeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }
}
