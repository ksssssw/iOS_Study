//
//  RotatedBadgeeSymbol.swift
//  Landmarks
//
//  Created by 1000288 on 2023/10/28.
//

import SwiftUI

struct RotatedBadgeeSymbol: View {
    let angle: Angle
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeeSymbol(angle: Angle(degrees: 5))
}
