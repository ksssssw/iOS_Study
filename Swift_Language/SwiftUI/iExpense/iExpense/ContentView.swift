//
//  ContentView.swift
//  iExpense
//
//  Created by 1000288 on 11/17/23.
//

import SwiftUI
import Observation

struct ContentView: View {
    @State private var someToggle = true
    
    var body: some View {
        ZStack {
            Color.black
            
            Toggle("확인", isOn: $someToggle)
                .toggleStyle(SwitchLightStyle())
                .labelsHidden()
        }
    }
}

struct SwitchLightStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isOn = configuration.isOn
        
        return ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 37, height: 15)
                .foregroundColor(isOn ? Color.gray : Color.blue)
                .overlay(alignment: isOn ? .leading : .trailing) {
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                }
        }
        .onTapGesture {
            withAnimation {
                configuration.isOn.toggle()
            }
        }
    }
}

struct Home: View {
    @State var index = 0
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    HomeTabView(index: $index)
                    
                    TabView(selection: $index) {
                        
                        Color.blue
                            .tag(0)
                        
                        Color.red
                            .tag(1)
                    }
                    .frame(maxWidth: .infinity, minHeight: proxy.size.height)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }
        }
        
    }
}

struct HomeTabView: View {
    @Binding var index: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            
            Text("Recomm.")
                .foregroundColor(self.index == 0 ? .white : .black)
                .fontWeight(.bold)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(self.index == 0 ? Color(red: 39.0/255.0, green: 37.0/255.0, blue: 88.0/255.0) : .white)
                .clipShape(Capsule())
                .onTapGesture {
                    withAnimation(.default) {
                        self.index = 0
                    }
                }
            
            Text("Top Charts")
                .foregroundColor(self.index == 1 ? .white : Color.black)
                .fontWeight(.bold)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(self.index == 1 ? Color(red: 39.0/255.0, green: 37.0/255.0, blue: 88.0/255.0) : .white)
                .clipShape(Capsule())
                .onTapGesture {
                    withAnimation(.default) {
                        self.index = 1
                    }
                }
            
            Spacer()
        }
    }
}

#Preview("CustomToggle") {
    ContentView()
}

//#Preview("HomeTabView") {
//    HomeTabView()
//}

#Preview("Home") {
    Home()
}

