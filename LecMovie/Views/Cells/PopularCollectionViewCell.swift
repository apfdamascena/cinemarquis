//
//  PopularCollectionViewCell.swift
//  LecMovie
//
//  Created by alexdamascena on 07/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PopularCollectionViewCell"
    
    var popularImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    var popularTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews(){
        contentView.addSubview(popularImage)
        contentView.addSubview(popularTitle)
    }
    
    private func setupContraints(){
        popularImageConstraints()
        popularTitleConstraints()
    }
    
    
    func draw(_ movie: Movie) {
        popularImage.image = UIImage(named: movie.backdrop)
        popularTitle.text = movie.title
    }
}

