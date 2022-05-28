//
//  CookingRecordListView.swift
//  CookingRecords
//
//  Created by 住山大誠 on 2022/05/12.
//

import SwiftUI
import SDWebImageSwiftUI

struct CookingRecordListView: View {
    @ObservedObject var viewModel = CookingRecordListViewModel()
    var filterCookingRecordList: [CookingRecord] {
            viewModel.cookingRecordList.filter { record in
                return viewModel.recipeButtonSaturation[record.recipeTypeStr()] ?? false
        }
    }
    
    private let threeColumnGrid = [
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0),
    ]
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    LazyVGrid(columns: threeColumnGrid, alignment: .leading, spacing: 0) {
                        ForEach(filterCookingRecordList, id: \.self) { record in
                            NavigationLink(destination: CookingRecordView(record: record)) {
                                WebImage(url: URL(string: record.imageUrl))
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fill)
                            }
                        }
                    }
                    if viewModel.showReloadButton{
                        Button(action: {
                            Task { await viewModel.update() }
                        }) {
                            Text("さらに古い結果を読み込む")
                                .font(.caption)
                        }
                    }
                }
                ShowRecipeButton(){
                    viewModel.showRecipeButton.toggle()
                }
                .offset(x: geometry.size.width * 4/5, y: geometry.size.height * 9/10)
                VStack {
                    if viewModel.showRecipeButton {
                        
                        RecipeButtonView(recipeType: RecipeType.mainDish) {
                            viewModel.recipeButtonSaturation["mainDish"]!.toggle()
                        }.environmentObject(viewModel)
                        .offset(x: geometry.size.width * 7/10, y: geometry.size.height * 5/8)
                        
                        RecipeButtonView(recipeType: RecipeType.sideDish) {
                            viewModel.recipeButtonSaturation["sideDish"]!.toggle()
                        }.environmentObject(viewModel)
                        .offset(x: geometry.size.width * 1/2, y: geometry.size.height * 3/5)
                        
                        RecipeButtonView(recipeType: RecipeType.soup) {
                            viewModel.recipeButtonSaturation["soup"]!.toggle()
                        }.environmentObject(viewModel)
                        .offset(x: geometry.size.width * 2/5, y: geometry.size.height * 3/5)
                    }
                }
            }
            .navigationBarTitle(Text("CookingRecord"))
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CookingRecordListView_Previews: PreviewProvider {
    static var previews: some View {
        CookingRecordListView()
    }
}
