//
//  Date+TimeAgo.swift
//  MindGray
//

import Foundation

extension Date {
    var timeAgo: String {
        let calendar = Calendar.current
        let now = Date()
        let days = calendar.dateComponents([.day], from: self, to: now).day ?? 0

        if days < 1 {
            return "hoy"
        } else if days < 30 {
            return days == 1 ? "hace 1 día" : "hace \(days) días"
        }

        let months = calendar.dateComponents([.month], from: self, to: now).month ?? 0
        if months < 12 {
            return months == 1 ? "hace 1 mes" : "hace \(months) meses"
        }

        let years = calendar.dateComponents([.year], from: self, to: now).year ?? 0
        return years == 1 ? "hace 1 año" : "hace \(years) años"
    }
}
