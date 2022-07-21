//
//  UpcomingCollectionViewCell+Constraints.swift
//  LecMovie
//
//  Created by alexdamascena on 20/07/22.
//

import UIKit

extension UpcomingCollectionViewCell {
    
    func upcomingImageConstraints(){
        upcomingImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upcomingImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            upcomingImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            upcomingImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            upcomingImage.heightAnchor.constraint(equalToConstant: 260)
        ])
    }
    
    
    func upcomingTitleConstraints(){
        upcomingTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upcomingTitle.topAnchor.constraint(equalTo: upcomingImage.bottomAnchor, constant: 8),
            upcomingTitle.widthAnchor.constraint(equalToConstant: 140),
            upcomingTitle.leftAnchor.constraint(equalTo: upcomingImage.leftAnchor),
        ])
    }
    
    func upcomingDateConstraints(){
        upcomingDate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upcomingDate.topAnchor.constraint(equalTo: upcomingImage.bottomAnchor),
            upcomingDate.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            upcomingDate.widthAnchor.constraint(equalToConstant: 48),
            upcomingDate.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}
