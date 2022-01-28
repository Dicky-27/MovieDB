//
//  MoviesForGridViewModel.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import SwiftUI

extension MoviesForGrid {
    class ViewModel: ObservableObject {
        
        @Published var genreMovie = ""
        @Published var movie: Movie
        
        init(movie: Movie) {
            self.movie = movie
            getMovieGenre()
        }
        
        private func getMovieGenre() {
            var genreArray = [String]()
            for i in movie.genre_ids {
                genreArray.append(Constant.genre[i] ?? "")
            }
            genreMovie = genreArray.joined(separator: ", ")
        }
    }
}
