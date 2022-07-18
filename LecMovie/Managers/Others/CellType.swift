//
//  CellType.swift
//  LecMovie
//
//  Created by alexdamascena on 17/07/22.
//

import Foundation

enum CellType: String {
    
    case popular = "popular-cell"
    case nowPlaying = "now-playing-cell"
    case upcoming = "upcoming-cell"
    
    var type: CellType {
        return self
    }

}
