//
//  SearchMovie.swift
//  LecMovie
//
//  Created by alexdamascena on 20/07/22.
//

import Foundation


struct SearchMovieResponse: Codable {
    let results: [SearchMovie]?
}

struct SearchMovie: Codable {
    
    let id: Int
    let logoPath: String?
    let name: String
    
}
