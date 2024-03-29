//
//  FeaturedCollectionView.swift
//  LecMovie
//
//  Created by alexdamascena on 14/07/22.
//

import UIKit

class FeaturedCollectionView: UICollectionView {
        
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.backgroundColor = UIColor(named: Constants.PRIMARY)
    }

    func configure(with model: FeaturedCollectionViewModel){
        self.register(model.cell, forCellWithReuseIdentifier: model.identifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.itemSize = CGSize(width: model.cellSize.width , height: model.cellSize.height)
        layout.scrollDirection = .horizontal
    
        self.collectionViewLayout = layout
        self.showsHorizontalScrollIndicator = false
    }
    
}
