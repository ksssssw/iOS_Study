//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 1000288 on 2023/10/30.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    Text(key)
                }
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview("Home") {
    CategoryHome()
        .environment(ModelData())
}
