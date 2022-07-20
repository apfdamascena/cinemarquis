//
//  SeeAllTableViewCell+Constraints.swift
//  LecMovie
//
//  Created by alexdamascena on 20/07/22.
//

import UIKit

extension SeeAllTableViewCell {
    
    func imageSeeAllConstraints(){
        imageSeeAll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageSeeAll.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            imageSeeAll.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            imageSeeAll.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            imageSeeAll.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func titleAndRatingStackConstraints(){
        titleAndRatingStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleAndRatingStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleAndRatingStack.leftAnchor.constraint(equalTo: imageSeeAll.rightAnchor, constant: 16),
            titleAndRatingStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            titleAndRatingStack.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func titleSeeAllContraints(){
        titleSeeAll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleSeeAll.topAnchor.constraint(equalTo: titleAndRatingStack.topAnchor),
            titleSeeAll.leftAnchor.constraint(equalTo: titleAndRatingStack.leftAnchor),
            titleSeeAll.rightAnchor.constraint(equalTo: titleAndRatingStack.rightAnchor, constant: -60),
            titleSeeAll.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func starConstraints(){
        star.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            star.leftAnchor.constraint(equalTo: titleSeeAll.rightAnchor),
            star.topAnchor.constraint(equalTo: titleAndRatingStack.topAnchor, constant: 4),
            star.widthAnchor.constraint(equalToConstant: 18),
            star.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func ratingLabelConstraints(){
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: titleAndRatingStack.topAnchor),
            ratingLabel.leftAnchor.constraint(equalTo: star.rightAnchor, constant: 4),
            ratingLabel.widthAnchor.constraint(equalToConstant: 27),
            ratingLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func dateLabelConstraints(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleAndRatingStack.bottomAnchor, constant: 8),
            dateLabel.leftAnchor.constraint(equalTo: titleAndRatingStack.leftAnchor),
            dateLabel.widthAnchor.constraint(equalTo: titleAndRatingStack.widthAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}

