//
//  FilteredMovieList.swift
//  SwiftDataTutorial
//
//  Created by fukuda taichiro on 2024/05/04.
//

import SwiftUI

struct FilteredMovieList: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationSplitView {
            MovieList(titleFilter: searchText)
                .searchable(text: $searchText)
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
        }
    }
}

#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
