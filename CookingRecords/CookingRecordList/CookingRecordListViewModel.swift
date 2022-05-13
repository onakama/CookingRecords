//
//  CookingRecordListViewModel.swift
//  CookingRecords
//
//  Created by 住山大誠 on 2022/05/12.
//

import Foundation

class CookingRecordListViewModel: ObservableObject {
    @Published var cookingRecord: [CookingRecord] = []

    //true: saturation(1.0)    false: saturation(0.0)
    @Published var recipeButtonSaturation = ["mainDish": true, "sideDish": true, "soup": true]

    
    init() { update() }
    
    func update() {
        do {
            let data = try CookingRecordListModel().jsonDecode()
            self.cookingRecord = data.cookingRecordList
        } catch let error{
            print(error)
        }
    }
}
