//
//  FeaturedViewController.swift
//  LecMovie
//
//  Created by alexdamascena on 06/07/22.
//

import UIKit



class FeaturedViewController: UIViewController {
    
    let featuredView = FeaturedView()
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = featuredView
        featuredView.popularCollectionView.dataSource = self
        featuredView.popularCollectionView.delegate = self
        featuredView.nowPlayingCollectionView.dataSource = self
        featuredView.nowPlayingCollectionView.delegate = self
        featuredView.upcommingCollectionView.dataSource = self
        featuredView.upcommingCollectionView.delegate = self
        title = "Featured"
    }
}

extension FeaturedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var identifier: String = ""
        if collectionView == featuredView.popularCollectionView {
            identifier = "teste"
        } else if collectionView == featuredView.nowPlayingCollectionView {
            identifier = "teste2"
        } else {
            identifier = "teste3"
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
}


