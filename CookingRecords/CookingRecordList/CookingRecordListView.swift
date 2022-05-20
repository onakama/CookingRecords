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
                Button(action: {
                    viewModel.showRecipeButton.toggle()
                }) {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .resizable().frame(width: 60.0, height: 60.0)
                        .frame(width: 30.0, height: 30.0)
                }
                .offset(x: geometry.size.width * 4/5, y: geometry.size.height * 9/10)
                VStack {
                    if viewModel.showRecipeButton {
                        Button(action: {
                            viewModel.recipeButtonSaturation["mainDish"]!.toggle()
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: 85.0, height: 85.0)
                                    .foregroundColor(.white)
                                Image("mainDish")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60.0, height: 60.0)
                                    .clipShape(Circle())
                                    .saturation(viewModel.recipeButtonSaturation["mainDish"]! ? 1.0: 0.0)
                                    .padding(.bottom, 10)
                                Text("主菜/主食")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .bold()
                                    .padding(.top, 40)
                            }
                        }
                        .offset(x: geometry.size.width * 7/10, y: geometry.size.height * 5/8)
                        Button(action: {
                            viewModel.recipeButtonSaturation["sideDish"]!.toggle()
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: 85.0, height: 85.0)
                                    .foregroundColor(.white)
                                Image("sideDish")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50.0, height: 50.0)
                                    .clipShape(Circle())
                                    .saturation(viewModel.recipeButtonSaturation["sideDish"]! ? 1.0: 0.0)
                                Text("副菜")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .bold()
                                    .padding(.top, 60)
                            }
                        }
                        .offset(x: geometry.size.width * 1/2, y: geometry.size.height * 3/5)
                        Button(action: {
                            viewModel.recipeButtonSaturation["soup"]!.toggle()
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: 85.0, height: 85.0)
                                    .foregroundColor(.white)
                                Image("soup")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60.0, height: 60.0)
                                    .clipShape(Circle())
                                    .saturation(viewModel.recipeButtonSaturation["soup"]! ? 1.0: 0.0)
                                Text("スープ")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .bold()
                                    .padding(.top, 60)
                            }
                        }
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
