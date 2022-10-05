//
//  MovieDetailView.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 19.09.22.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ZStack(alignment: .top) {
            backgroundView
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    headerView
                        .padding(.bottom, 20)
                    moviePosterView
                    movieOverview
                    // reviews
                    NavigationLink {
                        MovieReviewView(movie: movie)
                    } label: {
                        Text("Reviews")
                    }

                    
                    // cast
                    Spacer()
                }
                //.padding(.top, 84)
                .padding(.horizontal, 32)
            }
            .padding(.horizontal, 32)
        }
    }
    
    private var backgroundView: some View {
        moviePoster
            .blur(radius: 50)
    }
    
    private var headerView: some View {
        VStack(alignment: .leading) {
            Text(movie.titleWithLanguage)
                .font(.title)
            
            Text("Release Date: \(movie.release_date ?? "nd")")
                .font(.subheadline)
        }
        .foregroundColor(.black)
    }
    
    private var moviePosterView: some View {
        HStack(alignment: .center) {
            Spacer()
            moviePoster
                .frame(width: 200, height: 320)
            Spacer()
        }
    }
    
    private var movieOverview: some View {
        Text(movie.overview ?? "_")
            .font(.body)
            .foregroundColor(.black)
            .padding(.top, 16)
    }
    
    
    
    // TODO: replace with better solution
    private var moviePoster: some View {
        AsyncImage(url: URL(string: movie.posterPath)) { image in
            image.resizable().scaledToFill()
        } placeholder: {
            ProgressView()
        }
        
        .animation(.easeInOut(duration: 0.5))
        .transition(.opacity)
        .cornerRadius(20)
        .shadow(radius: 15)
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}
