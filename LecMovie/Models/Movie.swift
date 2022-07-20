//
//  Movie.swift
//  LecMovie
//
//  Created by alexdamascena on 14/07/22.
//

import Foundation


struct Movie: Codable {
    let title: String
    let posterPath: String
    let backdropPath: String
    let voteAverage: Float
    let releaseDate: String
    let overview: String
    
}
