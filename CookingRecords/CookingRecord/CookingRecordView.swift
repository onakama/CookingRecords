//
//  CookingRecordView.swift
//  CookingRecords
//
//  Created by 住山大誠 on 2022/05/14.
//

import SwiftUI

struct CookingRecordView: View {
    var viewModel = CookingRecordViewModel()

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
        CookingRecordView()
    }
}
