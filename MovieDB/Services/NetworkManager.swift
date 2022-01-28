//
//  NetworkManager.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import Combine
import Foundation

class NetworkManager: NSObject {
    static func loadData(url: String, completion: @escaping (Swift.Result<MovieList, Error>) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=7e6dc9e445f1edd16330cb045b7ba4c0") else { return }
            URLSession.shared.dataTask(with: url){ (data, _, _) in
                guard let data = data else { return }
                if let movies = try? JSONDecoder().decode(MovieList.self, from: data) {
                    completion(.success(movies))
                }
            }.resume()
    }
}
