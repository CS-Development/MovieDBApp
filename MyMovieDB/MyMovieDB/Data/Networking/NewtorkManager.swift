//
//  NewtorkManager.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 19.09.22.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case nilResponse
}


final class NetworkManager<T: Codable> {
    
    static func fetch(completion: @escaping(Result<T, NetworkError>)->Void ) {

    }

}
