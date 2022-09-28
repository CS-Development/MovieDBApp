//
//  NewtorkManager.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 19.09.22.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidResponse
    case nilResponse
}


final class NetworkManager<T: Codable> {
    
    static func fetch(from urlString: String, completion: @escaping(Result<T, NetworkError>)->Void ) {
        AF.request(urlString).responseDecodable(of: T.self) { response in
            if response.error != nil {
                completion(.failure(.invalidResponse))
                print(response.error!)
                // Logging!
                return
            }
            
            if let payload = response.value {
                completion(.success(payload))
                return
            }
            
            completion(.failure(.nilResponse))
        }
    }

}
