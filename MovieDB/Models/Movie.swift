//
//  Movie.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

struct Movie: Decodable, Identifiable {
    var vote_count: Int
    var id: Int
    var vote_average: Float
    var title: String
    var poster_path: String
    var original_language: String
    var original_title: String
    var adult: Bool
    var overview: String
    var popularity: Float
    var release_date: String
    var genre_ids: [Int]
}

extension Movie {
    static let preview = Movie(vote_count: 6054, id: 634649, vote_average: 8.5, title: "Spider-Man: No Way Home", poster_path: "/1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg", original_language: "en", original_title: "Spider-Man: No Way Home", adult: false, overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", popularity: 13195.451, release_date: "2021-12-15", genre_ids: [28,12,878])
}

