//
//  DateFormatter.swift
//  WWExtensions
//
//  Created by Sun on 2024/8/26.
//

import Foundation

extension DateFormatter {

    public static var amPmEnabled: Bool {
        guard let dateFormat = DateFormatter.dateFormat(fromTemplate: "j", options: 0, locale: Locale.current) else {
            return false
        }

        return dateFormat.contains("a")
    }
}
