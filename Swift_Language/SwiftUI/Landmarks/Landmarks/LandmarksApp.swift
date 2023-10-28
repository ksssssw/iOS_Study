//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 1000288 on 2023/10/25.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
