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
    
    let sectionContainer: SectionContainer
    
    init(sectionContainer: SectionContainer){
        self.sectionContainer = sectionContainer
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.sectionContainer = SectionContainer(handlers: [ PopularSectionHandler() ])
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = featuredView
        featuredView.popularCollectionView.dataSource = self
        featuredView.popularCollectionView.delegate = self
//        featuredView.nowPlayingCollectionView.dataSource = self
//        featuredView.nowPlayingCollectionView.delegate = self
//        featuredView.upcommingCollectionView.dataSource = self
//        featuredView.upcommingCollectionView.delegate = self
        title = "Featured"
    }
}

extension FeaturedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == featuredView.popularCollectionView {
//            return popularMovies.count
//        }
//
//        if collectionView == featuredView.nowPlayingCollectionView {
//            return nowPlayingMovies.count
//        }
//
//        return upcomingMovies.count
        
        return popularMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellModel = popularMovies[indexPath.item]
        return sectionContainer.collectionView(cellModel, collectionView, cellForItemAt: indexPath)
    }
    
}


