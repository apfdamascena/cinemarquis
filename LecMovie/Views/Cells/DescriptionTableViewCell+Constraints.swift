//
//  DescriptionTableViewCell+Constraints.swift
//  LecMovie
//
//  Created by alexdamascena on 20/07/22.
//

import UIKit

extension DescriptionTableViewCell {
    
    func imageDescriptionConstraints(){
        imageDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageDescription.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            imageDescription.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            imageDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            imageDescription.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func titleDescriptionConstraints(){
        titleDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleDescription.topAnchor.constraint(equalTo: imageDescription.topAnchor),
            titleDescription.leftAnchor.constraint(equalTo: imageDescription.rightAnchor, constant: 8),
            titleDescription.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -50),
            titleDescription.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func dateArrowStackConstraints(){
        dateArrowStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateArrowStack.topAnchor.constraint(equalTo: titleDescription.bottomAnchor, constant: 8),
            dateArrowStack.leftAnchor.constraint(equalTo: imageDescription.rightAnchor, constant: 8),
            dateArrowStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            dateArrowStack.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func dateLabelConstraints(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: dateArrowStack.topAnchor),
            dateLabel.leftAnchor.constraint(equalTo: dateArrowStack.leftAnchor),
            dateLabel.heightAnchor.constraint(equalTo: dateArrowStack.heightAnchor),
            dateLabel.widthAnchor.constraint(equalTo: dateArrowStack.widthAnchor, constant: -24)
        ])
    }
    
    func arrowRightConstraints(){
        arrowRight.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrowRight.leftAnchor.constraint(equalTo: dateLabel.rightAnchor),
            arrowRight.widthAnchor.constraint(equalToConstant: 22),
            arrowRight.heightAnchor.constraint(equalToConstant: 24),
            arrowRight.topAnchor.constraint(equalTo: dateArrowStack.topAnchor)
        ])
    }
}
