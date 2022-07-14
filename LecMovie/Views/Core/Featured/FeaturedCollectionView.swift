//
//  FeaturedCollectionView.swift
//  LecMovie
//
//  Created by alexdamascena on 14/07/22.
//

import UIKit

struct CellSize {
    
    let width: CGFloat
    let height: CGFloat
}

struct FeaturedCollectionViewModel {
    let identifier: String
    let cell: UICollectionViewCell.Type
    let cellSize: CellSize
}

class FeaturedCollectionView: UICollectionView {
    
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }

    func configure(with model: FeaturedCollectionViewModel){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.itemSize = CGSize(width: model.cellSize.width , height: model.cellSize.height)
        layout.scrollDirection = .horizontal
    
        self.collectionViewLayout = layout
        self.showsHorizontalScrollIndicator = false
        
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: model.identifier)
        
    }
    
}
