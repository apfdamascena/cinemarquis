//
//  DetailsDescription+Constraints.swift
//  LecMovie
//
//  Created by alexdamascena on 18/07/22.
//

import UIKit

extension DetailsDescription {
    
    func titleMovieConstraints(){
        titleMovie.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleMovie.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            titleMovie.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            titleMovie.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            titleMovie.heightAnchor.constraint(equalToConstant: 29)
        ])
    }
    
    func contentConstraints(){
        content.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: titleMovie.bottomAnchor, constant: 8),
            content.leftAnchor.constraint(equalTo: self.leftAnchor),
            content.widthAnchor.constraint(equalTo: self.widthAnchor),
            content.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func imageContentConstraints(){
        imageContent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageContent.topAnchor.constraint(equalTo: content.topAnchor, constant: 4),
            imageContent.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            imageContent.widthAnchor.constraint(equalToConstant: 125),
            imageContent.heightAnchor.constraint(equalToConstant: 193)
        ])
    }
    
    func starConstraints(){
        star.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            star.topAnchor.constraint(equalTo: content.topAnchor, constant:  8),
            star.leftAnchor.constraint(equalTo: imageContent.leftAnchor, constant:  125 + 24),
            star.widthAnchor.constraint(equalToConstant: 24),
            star.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func ratingLabelConstraints(){
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingLabel.leftAnchor.constraint(equalTo: star.rightAnchor, constant: 8),
            ratingLabel.topAnchor.constraint(equalTo: star.topAnchor),
            ratingLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            ratingLabel.heightAnchor.constraint(equalToConstant: 24)
            
        ])
    }
    
    func genreAndDurationViewConstraints(){
        genreAndDurationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genreAndDurationView.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 65),
            genreAndDurationView.leftAnchor.constraint(equalTo: imageContent.leftAnchor, constant:  125 + 24),
            genreAndDurationView.heightAnchor.constraint(equalToConstant: 95),
            genreAndDurationView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
        ])
    }
    
    func genreLabelConstraints(){
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: genreAndDurationView.topAnchor),
            genreLabel.leftAnchor.constraint(equalTo: genreAndDurationView.leftAnchor),
  
            genreLabel.widthAnchor.constraint(equalToConstant: 95),
            genreLabel.bottomAnchor.constraint(equalTo: genreAndDurationView.bottomAnchor, constant: -2)
        ])
    }
    
    func durationLabelConstraints() {
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            durationLabel.topAnchor.constraint(equalTo: genreAndDurationView.topAnchor, constant: 35),
            durationLabel.rightAnchor.constraint(equalTo: genreAndDurationView.rightAnchor),
            durationLabel.widthAnchor.constraint(equalToConstant: 79),
            durationLabel.heightAnchor.constraint(equalToConstant: 19)
            
        ])
    }
    
    func borderBottomConstraints(){
        borderBottom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            borderBottom.topAnchor.constraint(equalTo: self.bottomAnchor),
            borderBottom.leftAnchor.constraint(equalTo: self.leftAnchor),
            borderBottom.rightAnchor.constraint(equalTo: self.rightAnchor),
            borderBottom.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
