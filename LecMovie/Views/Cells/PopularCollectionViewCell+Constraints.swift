//
//  PopularCollectionViewCell+Constraints.swift
//  LecMovie
//
//  Created by alexdamascena on 17/07/22.
//

import UIKit


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
