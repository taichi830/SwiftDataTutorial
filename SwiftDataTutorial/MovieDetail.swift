//
//  MovieDetail.swift
//  SwiftDataTutorial
//
//  Created by fukuda taichiro on 2024/05/01.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    
    var body: some View {
        Form {
            TextField("Movie title", text: $movie.title)
            
            DatePicker("Release date ", selection: $movie.releaseDate)
        }
        .navigationTitle("Movie")
    }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
}
