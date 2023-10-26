//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 1000288 on 2023/10/26.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

#Preview("Turtle Rock") {
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
    
}

#Preview("Silver") {
    LandmarkRow(landmark: landmarks[1])
}
