//
//  MovieDetailView.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 19.09.22.
//

import SwiftUI

struct MovieDetailView: View {
    
    @StateObject private var loader: ImageLoader
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        
        _loader = StateObject(wrappedValue: ImageLoader(url: URL(string: movie.posterPath)!,
                                                        cache: Environment(\.imageCache).wrappedValue
                                                       ))
    }
    
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
            .onAppear {
                loader.load()
            }
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
    private var imageView: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                Rectangle().foregroundColor(Color.gray.opacity(0.4))
            }
        }
    }
    
    private var moviePoster: some View {
        /*
        AsyncImage(url: URL(string: movie.posterPath)) { image in
            image.resizable().scaledToFill()
        } placeholder: {
            ProgressView()
        }
         */
        
        imageView
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
