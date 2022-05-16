//
//  CookingRecordListViewModel.swift
//  CookingRecords
//
//  Created by 住山大誠 on 2022/05/12.
//

import Foundation

class CookingRecordListViewModel: ObservableObject {
    @MainActor @Published var cookingRecordList: [CookingRecord] = []

    //true: saturation(1.0)    false: saturation(0.0)
    @Published var recipeButtonSaturation = ["mainDish": true, "sideDish": true, "soup": true]

    
    init() { Task { await update() } }
    
    func update() async {
        do {
            let data = try await CookingRecordListModel.shared.httpGet(offset: cookingRecordList.count, limit: 30)
            await MainActor.run { [weak self] in
                self?.cookingRecordList += data.cookingRecordList
            }
        } catch let error{
            print(error)
        }
    }
    
    
}
