//
//  PopularCollectionViewCell.swift
//  LecMovie
//
//  Created by alexdamascena on 07/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    private let popularImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let popularText: UILabel = {
        let text = UILabel()
        text.font = .systemFont(ofSize: 16, weight: .regular)
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(popularImage)
        contentView.addSubview(popularText)
        contentView.backgroundColor = .blue
        layoutSubviews()
    }
    
    required init?(coder: NSCoder){
        fatalError("init coder has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        popularImage.frame = CGRect(x: 8, y: 0, width: 100, height: 140)
        popularText.frame = CGRect(x:  8, y: popularImage.frame.maxY + 8, width: UIScreen.main.bounds.width, height: 40)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        popularImage.image = nil
        popularText.text = ""
    }
    
}
