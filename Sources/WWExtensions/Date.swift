//
//  Date.swift
//  WWExtensions
//
//  Created by Sun on 2024/8/26.
//

import Foundation

// MARK: - Date + IWWExtension

extension Date: IWWExtension { }

extension WWExtension where Base == Date {

    public var startOfHour: Date? {
        let components = Calendar.current.dateComponents([.year, .month, .day, .hour], from: base)
        return Calendar.current.date(from: components)
    }

    public var startOfDay: Date {
        Calendar.current.startOfDay(for: base)
    }

    public var startOfMonth: Date? {
        let components = Calendar.current.dateComponents([.year, .month], from: startOfDay)
        return Calendar.current.date(from: components)
    }

    public func startOfMonth(ago: Int) -> Date? {
        var components = DateComponents()
        components.month = -ago

        guard let startOfMonth else {
            return nil
        }
        return Calendar.current.date(byAdding: components, to: startOfMonth)
    }

}
