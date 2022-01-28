//
//  Constants.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import Foundation

class Constant: NSObject {
    static let BASE_IMAGE_URL = "https://image.tmdb.org/t/p/original/"
    static let GET_MOVIES_LIST = "https://api.themoviedb.org/3/discover/movie?api_key=7e6dc9e445f1edd16330cb045b7ba4c0"
    static let GET_POPULER_LIST = "https://api.themoviedb.org/3/discover/movie?api_key=7e6dc9e445f1edd16330cb045b7ba4c0&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"
    static let genre = [
        28 : "Action",
        12 : "Adventure",
        16 : "Animation",
        35 : "Comedy",
        80 : "Crime",
        99 : "Documentary",
        8 : "Drama",
        10751 : "Family",
        14 : "Fantasy",
        36 : "History",
        27 : "Horror",
        10402 : "Music",
        9648 : "Mystery",
        10749 : "Romance",
        878 : "Science Fiction",
        10770 : "TV Movie",
        53 : "Thriller",
        10752 : "War",
        37 : "Western"
    ] as [AnyHashable : String]
}
