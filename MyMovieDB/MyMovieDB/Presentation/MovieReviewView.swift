//
//  MovieReviewView.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 19.09.22.
//

import SwiftUI

struct MovieReviewView: View {
    var movie: Movie
    
    @ObservedObject var movieReviewMgr: MovieReviewManager
    
    init(movie: Movie) {
        self.movie = movie
        self.movieReviewMgr = MovieReviewManager(movie: movie)
    }
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
            
            List {
                ForEach(movieReviewMgr.reviews) { review in
                    VStack {
                        Text(review.author ?? "nd")
                            .font(.title)
                            .bold()
                        Text(review.content ?? "-")
                            .font(.body)
                            .lineLimit(nil)
                    }
                    .foregroundColor(.black)
                    .listRowBackground(Color.clear)
                }
            }
            .onAppear {
                movieReviewMgr.getMovieReviews()
            }
        }
    }
}

//struct MovieReviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieReviewView()
//    }
//}
