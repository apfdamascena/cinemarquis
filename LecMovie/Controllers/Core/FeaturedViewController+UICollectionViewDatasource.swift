//
//  FeaturedViewController+UICollectionViewDatasource.swift
//  LecMovie
//
//  Created by alexdamascena on 18/07/22.
//

import UIKit


extension FeaturedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == featuredView.popularCollectionView {
            return popularMovies.count
        } else if collectionView == featuredView.nowPlayingCollectionView  {
            return nowPlayingMovies.count
        }
        return upcomingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == featuredView.popularCollectionView {
            guard let cell = featuredView.popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as? PopularCollectionViewCell else { return UICollectionViewCell() }
            let movie = popularMovies[indexPath.item]
            cell.draw(movie)
            return cell
        } else if collectionView == featuredView.nowPlayingCollectionView {
            guard let cell = featuredView.nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.identifier, for: indexPath) as? NowPlayingCollectionViewCell else { return UICollectionViewCell() }
            let movie = nowPlayingMovies[indexPath.row]
            cell.draw(movie)
            return cell
        } else {
            guard let cell = featuredView.upcommingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.identifier, for: indexPath) as? UpcomingCollectionViewCell else { return UICollectionViewCell() }
            let movie = upcomingMovies[indexPath.item]
            cell.draw(movie)
            return cell
        }
    }
    
}
