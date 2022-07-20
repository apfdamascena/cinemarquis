//
//  DetailsDescription+Constraints.swift
//  LecMovie
//
//  Created by alexdamascena on 18/07/22.
//

import UIKit

extension DetailsViewController {
    
    func backDropImageConstraints(){
        backdropImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backdropImage.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            backdropImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backdropImage.widthAnchor.constraint(equalTo:view.safeAreaLayoutGuide.widthAnchor),
            backdropImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func detailsDescriptionConstraints(){
        detailsDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsDescription.topAnchor.constraint(equalTo: backdropImage.bottomAnchor, constant: 8),
            detailsDescription.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailsDescription.widthAnchor.constraint(equalTo:view.safeAreaLayoutGuide.widthAnchor),
            detailsDescription.heightAnchor.constraint(equalToConstant: 265)
        ])
    }
    
    func overviewTitleConstraints(){
        overviewTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overviewTitle.topAnchor.constraint(equalTo: detailsDescription.bottomAnchor, constant: 16),
            overviewTitle.leftAnchor.constraint(equalTo: detailsDescription.leftAnchor, constant: 16),
            overviewTitle.rightAnchor.constraint(equalTo: detailsDescription.rightAnchor, constant: -16),
            overviewTitle.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func overviewTextConstraints(){
        overviewText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overviewText.topAnchor.constraint(equalTo: overviewTitle.bottomAnchor, constant: 16),
            overviewText.leftAnchor.constraint(equalTo: overviewTitle.leftAnchor),
            overviewText.rightAnchor.constraint(equalTo: overviewTitle.rightAnchor),
        ])
    }
}
