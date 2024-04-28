//
//  SwiftDataTutorialApp.swift
//  SwiftDataTutorial
//
//  Created by fukuda taichiro on 2024/04/28.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
