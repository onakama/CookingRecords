//
//  CookingRecordListViewModel.swift
//  CookingRecords
//
//  Created by 住山大誠 on 2022/05/12.
//

import Foundation

class CookingRecordListViewModel: ObservableObject {
    @MainActor @Published var cookingRecordList: [CookingRecord] = []
    @MainActor @Published var showReloadButton = true

    //true: saturation(1.0)    false: saturation(0.0)
    @Published var recipeButtonSaturation = ["mainDish": true, "sideDish": true, "soup": true]
    @Published var showRecipeButton = false
    
    init() { Task { await update() } }
    
    func update() async {
        do {
            let data = try await CookingRecordListModel.shared.httpGet(offset: cookingRecordList.count, limit: 30)
            print(data.pagination.offset)
            print(data.pagination.limit)
            print(data.pagination.total)
            
            await MainActor.run { [weak self] in
                self?.cookingRecordList += data.cookingRecordList
                if data.pagination.offset + data.pagination.limit > data.pagination.total {
                    self?.showReloadButton = false
                }
                
            }
        } catch let error{
            print(error)
        }
    }
    
    
}
