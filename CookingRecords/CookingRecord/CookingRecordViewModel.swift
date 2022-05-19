//
//  CookingRecordViewModel.swift
//  CookingRecords
//
//  Created by 住山大誠 on 2022/05/14.
//

import Foundation
class CookingRecordViewModel: ObservableObject {
    @Published var record: CookingRecord
    
    init(record: CookingRecord) {
        self.record = record
    }
}
