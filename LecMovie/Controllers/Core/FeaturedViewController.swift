//
//  FeaturedViewController.swift
//  LecMovie
//
//  Created by alexdamascena on 06/07/22.
//

import UIKit


class FeaturedViewController: UIViewController {
    
    let featuredView = FeaturedView()
    
    let popularMovies = Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
    let upcomingMovies = Movie.upcomingMovies()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Featured"
        self.view = featuredView
        featuredView.nowPlayingCollectionView.dataSource = self
        featuredView.popularCollectionView.dataSource = self

    }
}

extension FeaturedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == featuredView.popularCollectionView {
            return popularMovies.count
        }
        return nowPlayingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == featuredView.popularCollectionView {
            guard let cell = featuredView.popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as? PopularCollectionViewCell else { return UICollectionViewCell() }
            let movie = popularMovies[indexPath.item]
            cell.draw(movie)
            return cell
        } else{
            guard let cell = featuredView.nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.identifier, for: indexPath) as? NowPlayingCollectionViewCell else { return UICollectionViewCell() }
            let movie = nowPlayingMovies[indexPath.row]
            cell.draw(movie)
            return cell
        }
    }
    
}


