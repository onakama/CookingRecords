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
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
}
