//
//  ContentView.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 19.09.22.
//

import SwiftUI

struct ContentView: View {
    @State private var searchTerm = ""
    @ObservedObject var movieManager = MovieDownloadManager()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search...", text: $searchTerm)
            }
            List(movieManager.movies.filter{
                searchTerm.isEmpty
                ? true
                : $0.title?
                    .lowercased()
                    .localizedStandardContains(searchTerm.lowercased()) ?? true
            }) { movie in
                Text(movie.titleWithLanguage)
                    .listRowBackground(Color.clear)
            }
            .background(Color.white)
        }
        .padding()
        .onAppear {
            movieManager.getNowPlaying()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
