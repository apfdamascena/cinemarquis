//
//  FeatureView+Constraints.swift
//  LecMovie
//
//  Created by alexdamascena on 14/07/22.
//

import UIKit

extension FeaturedView {
    
     func scrollViewConstraints(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 16),
            scrollView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor)
        ])
    }
    
    func popularLabelContraints(){
        popularLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popularLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            popularLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 8),
            popularLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            popularLabel.heightAnchor.constraint(equalToConstant: 31)
        ])
    }
    
    func popularCollectionViewConstraints(){
        popularCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popularCollectionView.topAnchor.constraint(equalTo: popularLabel.bottomAnchor, constant: 8),
            popularCollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            popularCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            popularCollectionView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    func nowPlayingLabelConstraints(){
        nowPlayingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nowPlayingLabel.topAnchor.constraint(equalTo: popularCollectionView.bottomAnchor, constant: 8),
            nowPlayingLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 8),
            nowPlayingLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            nowPlayingLabel.heightAnchor.constraint(equalToConstant: 31)
        ])
    }
    
    func nowPlayingCollectionViewConstraints(){
        nowPlayingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nowPlayingCollectionView.topAnchor.constraint(equalTo: nowPlayingLabel.bottomAnchor, constant: 8),
            nowPlayingCollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            nowPlayingCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            nowPlayingCollectionView.heightAnchor.constraint(equalToConstant: 380)
        ])
    }
    
    func upcomingLabelConstraints(){
        upcomingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upcomingLabel.topAnchor.constraint(equalTo: nowPlayingCollectionView.bottomAnchor, constant: 16),
            upcomingLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 8),
            upcomingLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            upcomingLabel.heightAnchor.constraint(equalToConstant: 31)
        ])
    }
    
    func upcommingCollectionViewConstraints(){
        upcommingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upcommingCollectionView.topAnchor.constraint(equalTo: upcomingLabel.bottomAnchor, constant: 8),
            upcommingCollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            upcommingCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            upcommingCollectionView.heightAnchor.constraint(equalToConstant: 304)
        ])
    }
}
