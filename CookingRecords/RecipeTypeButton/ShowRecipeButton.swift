//
//  ShowRecipeButton.swift
//  CookingRecords
//
//  Created by onakama on 2022/05/28.
//

import SwiftUI

struct ShowRecipeButton: View {
    private var recipeTypeHandler: () -> Void
    init(action handler: @escaping() -> Void) {
        self.recipeTypeHandler = handler
    }
    
    var body: some View {
        Button(action: {
            recipeTypeHandler()
        }) {
            Image(systemName: "line.3.horizontal.decrease.circle")
                .resizable().frame(width: 60.0, height: 60.0)
                .frame(width: 30.0, height: 30.0)
        }
    }
}

struct ShowRecipeButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowRecipeButton(action: {} )
    }
}
