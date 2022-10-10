//
//  DiscoverView.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 19.09.22.
//

import SwiftUI

struct DiscoverView: View {
    
    @ObservedObject private var movieManager = MovieDownloadManager()
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: true) {
                HStack() {
                    ForEach(movieManager.movies) { movie in
                        movieCard(movie: movie)
                            .frame(width: geo.size.width)
                    }
                }
            }
            .frame(width: geo.size.width)
            .onAppear {
                movieManager.getPopular()
            }
        }
    }
    
    private func movieCard(movie: Movie) -> some View {
        ZStack(alignment: .bottom) {
            moviePoster(movie: movie)
            detailView(movie: movie)
        }
    }
    
    private func moviePoster(movie: Movie) -> some View {
        AsyncImage(url: URL(string: movie.posterPath)) { image in
            image.resizable().scaledToFill()
        } placeholder: {
            ProgressView()
        }
        .frame(width: UIScreen.main.bounds.width * 0.9,
               height: UIScreen.main.bounds.height * 0.75,
               alignment: .center)
        .animation(.easeInOut(duration: 0.5), value: 1.0) //scale
        .transition(.opacity)
        .cornerRadius(15)
        .shadow(radius: 15)
    }
    
    private func detailView(movie: Movie) -> some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(movie.titleWithLanguage)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.top)
                
                Text(movie.overview ?? "")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.top)
                
                NavigationLink {
                    MovieDetailView(movie: movie)
                } label: {
                    Text("Details")
                        .bold()
                        .padding()
                        .foregroundColor(Color.black)
                        .background(Color.orange)
                        .cornerRadius(12)
                }
            }
            .background(Color.white.opacity(0.6))
        }
        .padding()
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
