//
//  NowPlayingCollectionViewCell.swift
//  LecMovie
//
//  Created by alexdamascena on 17/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "now-playing-collection-view-cell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
//        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews(){
        
    }
}
