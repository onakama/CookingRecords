//
//  CookingRecordViewModel.swift
//  CookingRecords
//
//  Created by 住山大誠 on 2022/05/14.
//

import Foundation
class CookingRecordViewModel {
    var record = CookingRecord(imageUrl: "https://cooking-records.herokuapp.com/images/1.jpg", comment: "パンチのきいた辛味が印象的です。", recipeType: CookingRecord.RecipeType.mainDish, recordedAt: DateFormatter.formatter.date(from: "2018-04-19 14:05:41")!)
}
