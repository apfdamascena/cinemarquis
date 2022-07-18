//
//  SectionHandler.swift
//  LecMovie
//
//  Created by alexdamascena on 14/07/22.
//

import Foundation
import UIKit



protocol SectionHandler {
    
    var type: String { get }
    
    func collectionView(_ cellModel: Movie,
                        _ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell    
}


