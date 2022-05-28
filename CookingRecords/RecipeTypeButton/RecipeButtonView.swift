//
//  RecipeButton.swift
//  CookingRecords
//
//  Created by onakama on 2022/05/28.
//

import SwiftUI

struct RecipeButtonView: View {
    private var recipeTypeHandler: () -> Void
    private var recipeType: RecipeType
    @EnvironmentObject private var viewModel: CookingRecordListViewModel
    init(recipeType: RecipeType, action handler: @escaping() -> Void) {
        self.recipeTypeHandler = handler
        self.recipeType = recipeType
    }
    var body: some View {
        Button(action: {
            recipeTypeHandler()
        }) {
            ZStack {
                Circle()
                    .frame(width: 85.0, height: 85.0)
                    .foregroundColor(.white)
                Image("\(self.recipeType.rawValue)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60.0, height: 60.0)
                    .clipShape(Circle())
                    .saturation(viewModel.recipeButtonSaturation[self.recipeType.rawValue]! ? 1.0: 0.0)
                    .padding(.bottom, 10)
                Text("主菜/主食")
                    .font(.body)
                    .foregroundColor(.black)
                    .bold()
                    .padding(.top, 40)
            }
        }
    }
}

struct RecipeButton_Previews: PreviewProvider {
    static var previews: some View {
        RecipeButtonView(recipeType: RecipeType.mainDish) {}
    }
}
