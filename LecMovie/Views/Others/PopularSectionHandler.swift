//
//  PopularSectionHandler.swift
//  LecMovie
//
//  Created by alexdamascena on 17/07/22.
//

import UIKit

class ListDataType {
    
    static let popular: CellType = .popular
    static let nowPlaying: CellType = .nowPlaying
    static let upcoming: CellType = .upcoming
    
}


class PopularSectionHandler: SectionHandler {
    
    var type: String {
        return ListDataType.popular.rawValue
    }
    
    func collectionView(_ cellModel: Movie, _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as? PopularCollectionViewCell else { return UICollectionViewCell() }
        
        popularCell.draw(cellModel)
        return popularCell
    }
}
