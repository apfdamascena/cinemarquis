//
//  PopularCollectionViewCell.swift
//  LecMovie
//
//  Created by alexdamascena on 07/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "popular-collection-view-cell"
    
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
        print(movie)
        popularImage.image = UIImage(named: movie.backdrop)
        popularTitle.text = movie.title
    
    }
    
}

extension PopularCollectionViewCell {
    
    func popularImageConstraints(){
        popularImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popularImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            popularImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4),
            popularImage.widthAnchor.constraint(equalToConstant: contentView.frame.width - 8),
            popularImage.heightAnchor.constraint(equalToConstant: 101)
        ])
    }
    
    func popularTitleConstraints(){
        popularTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popularTitle.topAnchor.constraint(equalTo: popularImage.bottomAnchor, constant: 4),
            popularTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4),
            popularTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
}
