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
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    @State private var newMovie: Movie?
    
    var body: some View {
        NavigationSplitView {
            Group {
                if !movies.isEmpty {
                    List {
                        ForEach(movies) { movie in
                            NavigationLink {
                                MovieDetail(movie: movie, isNew: false)
                            } label: {
                                Text(movie.title)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                } else {
                    ContentUnavailableView {
                        Label("No Movies", systemImage: "film.stack")
                    }
                }
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
            .sheet(item: $newMovie) { movie in
                NavigationStack {
                    MovieDetail(movie: movie, isNew: true)
                }
                .interactiveDismissDisabled()
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
            newMovie = newItem
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
        .modelContainer(SampleData.shared.modelContainer)
}
