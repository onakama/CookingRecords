//
//  CookingRecordView.swift
//  CookingRecords
//
//  Created by 住山大誠 on 2022/05/14.
//

import SwiftUI

struct CookingRecordView: View {
    @ObservedObject var viewModel: CookingRecordViewModel

    init(record: CookingRecord) {
        self.viewModel = CookingRecordViewModel(record: record)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: viewModel.record.imageUrl)) { image in
                image
                .resizable()
                .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            HStack {
                Spacer()
                Text(DateFormatter.formatter.string(from: viewModel.record.recordedAt))
            }
            Text(viewModel.record.comment)
        }
    }
}

struct CookingRecordView_Previews: PreviewProvider {
    static var previews: some View {
        let record = CookingRecord(imageUrl: "https://cooking-records.herokuapp.com/images/1.jpg", comment: "パンチのきいた辛味が印象的です。", recipeType: CookingRecord.RecipeType.mainDish, recordedAt: DateFormatter.formatter.date(from: "2018-04-19 14:05:41")!)
        CookingRecordView(record: record)
    }
}
