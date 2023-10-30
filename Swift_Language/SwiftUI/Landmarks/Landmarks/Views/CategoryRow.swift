//
//  CategoryRow.swift
//  Landmarks
//
//  Created by 1000288 on 2023/10/30.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue, 
        items: Array(landmarks.prefix(3))
    )
}
