//
//  Movies.swift
//  SwiftDataTutorial
//
//  Created by fukuda taichiro on 2024/04/29.
//

import SwiftUI
import SwiftData

struct Movies: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var movies: [Movie]
    
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies) { movie in
                    NavigationLink {
                        Text(movie.title)
                            .navigationTitle("Movie")
                    } label: {
                        Text(movie.title)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addMovie) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
        }
    }
    
    
    private func addMovie() {
        withAnimation {
            let newItem = Movie(title: "New Movie", releaseDate: .now)
            modelContext.insert(newItem)
        }
    }
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(movies[index])
            }
        }
    }
}

#Preview {
    Movies()
        .modelContainer(for: Movie.self, inMemory: true)
}
