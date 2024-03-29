//
//  FeaturedViewController.swift
//  LecMovie
//
//  Created by alexdamascena on 06/07/22.
//

import UIKit


class FeaturedViewController: UIViewController {
    
    let featuredView = FeaturedView()
    
    var popularMovies: [Movie] = []
    var nowPlayingMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    
    
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
        
        setupColors()
        getAllData()
        
    }
    
    private func setupColors(){
        navigationController?.navigationBar.barTintColor = UIColor(named: Constants.PRIMARY)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: Constants.TEXT) ?? .black]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor(named: Constants.TEXT) ?? .black]
    }

    private func getAllData(){
        
        Task {
            let data = await APICaller.shared.makeRequest(with: Endpoint(path: "/3/movie/popular", queryItems: []),
                                         expecting: MovieResponse.self)
            guard let movies = try? data.get() else { return }
            self.popularMovies = movies.results
            self.featuredView.popularCollectionView.reloadData()
        }
        
        Task {
            let data = await APICaller.shared.makeRequest(with: Endpoint(path: "/3/movie/now_playing", queryItems: []),
                                         expecting: MovieResponse.self)
            guard let movies = try? data.get() else { return }
            self.nowPlayingMovies = movies.results
            self.featuredView.nowPlayingCollectionView.reloadData()
        }
        
        Task {
            let data = await APICaller.shared.makeRequest(with: Endpoint(path: "/3/movie/upcoming", queryItems: []),
                                         expecting: MovieResponse.self)
            guard let movies = try? data.get() else { return }
            self.upcomingMovies = movies.results
            self.featuredView.upcommingCollectionView.reloadData()
        }
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
        seeAllViewController.isNowPlaying = true
        self.navigationController?.pushViewController(seeAllViewController, animated: false)
    }
    
    func showAllUpcoming() {
        let seeAllViewController = SeeAllViewController()
        seeAllViewController.seeAllTitle = "Upcoming"
        seeAllViewController.isNowPlaying = false
        self.navigationController?.pushViewController(seeAllViewController, animated: false)
        
    }
}


