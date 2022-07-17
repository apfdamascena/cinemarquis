//
//  SectionHandler.swift
//  LecMovie
//
//  Created by alexdamascena on 14/07/22.
//

import Foundation
import UIKit


enum CellType: String {
    
    case popular = "popular-cell"
    case nowPlaying = "now-playing-cell"
    case upcoming = "upcoming-cell"
    
    var type: CellType {
        return self
    }

}

protocol SectionHandler {
    
    var type: String { get }
    
    func collectionView(_ cellModel: Movie,
                        _ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell    
}


