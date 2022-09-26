//
//  Review.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 19.09.22.
//

import Foundation

struct ReviewResponse: Codable {
    var results: [Review]
}
struct Review: Codable, Identifiable {
    var id: String?
    var author: String?
    var content: String?
}

