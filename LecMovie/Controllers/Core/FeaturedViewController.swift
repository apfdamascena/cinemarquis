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
        featuredView.delegate = self
        featuredView.nowPlayingCollectionView.dataSource = self
        featuredView.nowPlayingCollectionView.delegate = self
        featuredView.popularCollectionView.dataSource = self
        featuredView.popularCollectionView.delegate = self
        featuredView.upcommingCollectionView.dataSource = self
        featuredView.upcommingCollectionView.delegate = self
    }
}

extension FeaturedViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var model: Movie
        let index = indexPath.item
        
        if collectionView ==  featuredView.popularCollectionView {
            model = popularMovies[index]
        } else if collectionView == featuredView.nowPlayingCollectionView {
            model = nowPlayingMovies[index]
        } else {
            model = upcomingMovies[index]
        }
        
        let detailsViewController = DetailsViewController()
        detailsViewController.movie = model
        self.navigationController?.pushViewController(detailsViewController, animated: false)
    }
    
}

extension FeaturedViewController: FeaturedViewProtocol {
    
    func showAllNowPlaying() {
        let seeAllViewController = SeeAllViewController()
        seeAllViewController.seeAllTitle = "Now Playing"
        seeAllViewController.movies = nowPlayingMovies
        self.navigationController?.pushViewController(seeAllViewController, animated: false)
    }
    
    func showAllUpcoming() {
        let seeAllViewController = SeeAllViewController()
        seeAllViewController.seeAllTitle = "Upcoming"
        seeAllViewController.movies = upcomingMovies
        self.navigationController?.pushViewController(seeAllViewController, animated: false)
        
    }
}


