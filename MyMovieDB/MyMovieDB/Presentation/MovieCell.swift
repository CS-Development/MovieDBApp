//
//  MovieCell.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 19.09.22.
//

import SwiftUI

struct MovieCell: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            moviePoster
            VStack {
                movieTitle
                    .padding(.bottom, 5)
                HStack {
                    movieVotes
                    movieReleaseDate
                }
                .padding(.bottom, 5)
                movieOverview
            }
        }
    }
    
    private var moviePoster: some View {
        AsyncImage(url: URL(string: movie.posterPath)) { image in
            image.resizable().scaledToFill()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 100, height: 160)
        .animation(.easeInOut(duration: 0.5))
        .transition(.opacity)
        .cornerRadius(15)
        .shadow(radius: 15)
    }
    
    private var movieTitle: some View {
        Text(movie.titleWithLanguage)
            .font(.system(size: 15))
            .bold()
            .foregroundColor(.blue)
    }
    
    private var movieVotes: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: CGFloat(movie.voteAverage))
                .stroke(Color.orange, lineWidth: 4)
                .frame(width: 50)
                .rotationEffect(.degrees(-90))
            
            Circle()
                .trim(from: 0, to: 1)
                .stroke(Color.orange.opacity(0.2), lineWidth: 4)
                .frame(width: 50)
                .rotationEffect(.degrees(-90))
            
            Text(String.init(format: "%0.2f", movie.vote_average ?? 0.0))
                .foregroundColor(.orange)
                .font(.subheadline)
        }
        .frame(height: 80)
    }
    
    private var movieReleaseDate: some View {
        Text(movie.release_date ?? "-")
            .font(.subheadline)
    }
    
    private var movieOverview: some View {
        Text(movie.overview ?? "-")
            .lineLimit(5)
            .font(.body)
    }
}

//struct MovieCell_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieCell(movie: Movie()
//    }
//}
