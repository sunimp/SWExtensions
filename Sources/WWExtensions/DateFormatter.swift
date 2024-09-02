//
//  DateFormatter.swift
//
//  Created by Sun on 2022/9/20.
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
