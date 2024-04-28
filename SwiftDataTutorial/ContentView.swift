//
//  ContentView.swift
//  SwiftDataTutorial
//
//  Created by fukuda taichiro on 2024/04/28.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection,
                content:  {
            Birthday().tag(Tab.featured)
                .tabItem {
                    Label("Birthday", systemImage: "birthday.cake")
                }
            Movies().tag(Tab.list)
                .tabItem {
                    Label("Movie", systemImage: "list.bullet")
                }
        })
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
