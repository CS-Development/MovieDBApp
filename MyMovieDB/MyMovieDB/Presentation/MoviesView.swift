//
//  MoviesView.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 19.09.22.
//

import SwiftUI

struct MoviesView: View {
    @State private var searchTerm = ""
    @ObservedObject var movieManager = MovieDownloadManager()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search...", text: $searchTerm)
            }
            Text("List of now playing movies...")
            List(movieManager.movies.filter{
                searchTerm.isEmpty
                ? true
                : $0.title?
                    .lowercased()
                    .localizedStandardContains(searchTerm.lowercased()) ?? true
            }) { movie in
                NavigationLink{
                    MovieDetailView(movie: movie)
                } label: {
                    MovieCell(movie: movie)
                        .listRowBackground(Color.clear)
                }
            }
            .background(Color.white)
        }
        .padding()
        .onAppear {
            movieManager.getNowPlaying()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
