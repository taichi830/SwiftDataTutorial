//
//  SampleData.swift
//  SwiftDataTutorial
//
//  Created by fukuda taichiro on 2024/04/30.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var contezt: ModelContext {
        modelContainer.mainContext
    }
    
    init() {
        let schema = Schema([
            Movie.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    func insertSampleData() {
        for movie in Movie.sampleData {
            contezt.insert(movie)
        }
        
        do {
            try contezt.save()
        } catch {
            print("Sample data context failed to save.")
        }
    }
}
