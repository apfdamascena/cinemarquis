//
//  TrendingMovie.swift
//  LecMovie
//
//  Created by alexdamascena on 20/07/22.
//

import Foundation


struct TrendingMovie: Codable {
    let title: String
    
    let posterPath: String?
    let backdropPath: String?
    let voteAverage: Float
    let releaseDate: String
    let overview: String
}
