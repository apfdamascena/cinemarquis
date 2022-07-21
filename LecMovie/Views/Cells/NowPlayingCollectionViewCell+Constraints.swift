//
//  NowPlayingCollectionViewCell+Constraints.swift
//  LecMovie
//
//  Created by alexdamascena on 18/07/22.
//

import UIKit


extension NowPlayingCollectionViewCell {
    
    func nowPlayingImageConstraints(){
        nowPlayingImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nowPlayingImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            nowPlayingImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            nowPlayingImage.heightAnchor.constraint(equalToConstant: 90),
            nowPlayingImage.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    func nowPlayingTitleConstraints(){
        nowPlayingTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nowPlayingTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nowPlayingTitle.leftAnchor.constraint(equalTo: nowPlayingImage.rightAnchor, constant: 16),
            nowPlayingTitle.widthAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    func nowPlayingSubtitleConstraints(){
        nowPlayingSubtitle.translatesAutoresizingMaskIntoConstraints = false
        let widthUsed = 12 + nowPlayingImage.frame.width + 16
        let remaindedWidth = contentView.frame.width - widthUsed
        NSLayoutConstraint.activate([
            nowPlayingSubtitle.topAnchor.constraint(equalTo: nowPlayingTitle.bottomAnchor, constant: 8),
            nowPlayingSubtitle.leftAnchor.constraint(equalTo: nowPlayingImage.rightAnchor, constant: 16),
            nowPlayingSubtitle.widthAnchor.constraint(equalToConstant: remaindedWidth)
        ])
    }
    
    func borderBottomConstraints(){
        borderBottom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            borderBottom.heightAnchor.constraint(equalToConstant: 1),
            borderBottom.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            borderBottom.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            borderBottom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
