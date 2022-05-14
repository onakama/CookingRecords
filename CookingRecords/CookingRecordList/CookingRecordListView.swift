//
//  CookingRecordListView.swift
//  CookingRecords
//
//  Created by 住山大誠 on 2022/05/12.
//

import SwiftUI

struct CookingRecordListView: View {
    @ObservedObject var viewModel = CookingRecordListViewModel()
    var filterCookingRecordList: [CookingRecord] {
            viewModel.cookingRecord.filter { record in
                print(record.recipeType.rawValue)
                return viewModel.recipeButtonSaturation[record.recipeTypeStr()] ?? false
        }
    }
    
    private let threeColumnGrid = [
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0),
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: threeColumnGrid, alignment: .leading, spacing: 0) {
                    ForEach(filterCookingRecordList, id: \.self) { num in
                        ZStack {
                            Image("image3")
                                .resizable()
                                .aspectRatio(1, contentMode: .fill)
                        }
                    }
                }
            }
            VStack {
                Button(action: {
                    viewModel.recipeButtonSaturation["mainDish"]!.toggle()
                }) {
                    ZStack {
                        Image("mainDish")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60.0, height: 60.0)
                            .clipShape(Circle())
                            .saturation(viewModel.recipeButtonSaturation["mainDish"]! ? 1.0: 0.0)
                        Text("主菜/主食")
                            .foregroundColor(.black)
                            .bold()
                            .padding(.top, 65)
                    }
                }
                Button(action: {
                    viewModel.recipeButtonSaturation["sideDish"]!.toggle()
                }) {
                    ZStack {
                        Image("sideDish")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60.0, height: 60.0)
                            .clipShape(Circle())
                            .saturation(viewModel.recipeButtonSaturation["sideDish"]! ? 1.0: 0.0)
                        Text("副菜")
                            .foregroundColor(.black)
                            .bold()
                            .padding(.top, 65)
                    }
                }
                Button(action: {
                    viewModel.recipeButtonSaturation["soup"]!.toggle()
                }) {
                    ZStack {
                        Image("soup")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60.0, height: 60.0)
                            .clipShape(Circle())
                            .saturation(viewModel.recipeButtonSaturation["soup"]! ? 1.0: 0.0)
                        Text("スープ")
                            .foregroundColor(.black)
                            .bold()
                            .padding(.top, 65)
                    }
                }
            }
            .offset(x: geometry.size.width * 3/4, y: geometry.size.height * 3/5)
        }
    }
}

struct CookingRecordListView_Previews: PreviewProvider {
    static var previews: some View {
        CookingRecordListView()
    }
}
