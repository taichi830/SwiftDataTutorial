//
//  MovieDetail.swift
//  SwiftDataTutorial
//
//  Created by fukuda taichiro on 2024/05/01.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    init(movie: Movie, isNew: Bool) {
        self.movie = movie
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Movie title", text: $movie.title)
            
            DatePicker("Release date ", selection: $movie.releaseDate)
        }
        .navigationTitle(isNew ? "New Movie" : "Movie")
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        modelContext.delete(movie)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview("New Movie") {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie, isNew: true)
            .navigationBarTitleDisplayMode(.inline)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
