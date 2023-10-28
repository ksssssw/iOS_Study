//
//  ContentView.swift
//  Landmarks
//
//  Created by 1000288 on 2023/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
