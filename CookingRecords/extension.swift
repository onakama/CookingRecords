//
//  extension.swift
//  CookingRecords
//
//  Created by 住山大誠 on 2022/05/14.
//

import Foundation

extension DateFormatter {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.timeZone = TimeZone(identifier:  "Asia/Tokyo")
        formatter.dateFormat = "yyyy-mm-dd HH:mm:ss"
        return formatter
    }()
}
