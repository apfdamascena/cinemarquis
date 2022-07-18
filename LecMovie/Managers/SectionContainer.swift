//
//  SectionContainer.swift
//  LecMovie
//
//  Created by alexdamascena on 17/07/22.
//

import Foundation
import UIKit


class SectionContainer {
    
    var sectionHandlers: [String: SectionHandler] = [:]
    
    init(handlers: [SectionHandler]){
        handlers.forEach{ handler in
            sectionHandlers[handler.type] = handler
        }
    }
    
    func collectionView(_ cellModel: Movie,
                        _ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        guard let sectionHandler = sectionHandlers[cellModel.type.rawValue] else { return UICollectionViewCell() }
        return sectionHandler.collectionView(cellModel, collectionView, cellForItemAt: indexPath)
    }
}
