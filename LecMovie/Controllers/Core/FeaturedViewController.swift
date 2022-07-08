//
//  FeaturedViewController.swift
//  LecMovie
//
//  Created by alexdamascena on 06/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    var popularCollectionView: UICollectionView!
    var nowPlayingCollectionView: UICollectionView!
    
    struct Constants {
        static let POPULAR_IDENTIFIER = "popular-view-cell"
        static let NOW_PLAYING_IDENTIFIER = "now-playing-view-cell"
    }
    
    private lazy var popularLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nowPlayingLabel: UILabel = {
        let label = UILabel()
        label.text = "Now Playing"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var 
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Featured"
        view.addSubview(popularLabel)
        setupPopularCollectionView()
        view.addSubview(nowPlayingLabel)
        setupNowPlayingCollectionView()
        setupContraints()
    }
    
    private func setupPopularCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.itemSize = CGSize(width: 200, height: 140)
        layout.scrollDirection = .horizontal
        
        popularCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.backgroundColor = .white
        popularCollectionView.showsVerticalScrollIndicator = false
        popularCollectionView.showsHorizontalScrollIndicator = false
        
        popularCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.POPULAR_IDENTIFIER)
        self.view.addSubview(popularCollectionView)
    }
    
    private func setupNowPlayingCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 0, right: 8)
        layout.itemSize = CGSize(width: 251, height: 114)
        layout.scrollDirection = .horizontal
        
        nowPlayingCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        nowPlayingCollectionView.dataSource = self
        nowPlayingCollectionView.delegate = self
        nowPlayingCollectionView.backgroundColor = .yellow
        nowPlayingCollectionView.showsVerticalScrollIndicator = false
        nowPlayingCollectionView.showsHorizontalScrollIndicator = false
        
        nowPlayingCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.NOW_PLAYING_IDENTIFIER)
        self.view.addSubview(nowPlayingCollectionView)
    }
        
    private func setupContraints(){
        popularLabelConstraints()
        popularCollectionConstraints()
        nowPlayingLabelConstraints()
        nowPlayingCollectionConstraints()
    }
    
    private func popularLabelConstraints(){
        NSLayoutConstraint.activate([
            popularLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ),
            popularLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            popularLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: UIScreen.main.bounds.width - 16),
            popularLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func popularCollectionConstraints(){
        popularCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popularCollectionView.topAnchor.constraint(equalTo: popularLabel.bottomAnchor),
            popularCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            popularCollectionView.heightAnchor.constraint(equalToConstant: 200),
            popularCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: UIScreen.main.bounds.width - 16)
        ])
    }
    
    private func nowPlayingLabelConstraints(){
        NSLayoutConstraint.activate([
            nowPlayingLabel.topAnchor.constraint(equalTo: popularCollectionView.bottomAnchor),
            nowPlayingLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            nowPlayingLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: UIScreen.main.bounds.width - 16),
            nowPlayingLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func nowPlayingCollectionConstraints(){
        nowPlayingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nowPlayingCollectionView.topAnchor.constraint(equalTo: nowPlayingLabel.bottomAnchor),
            nowPlayingCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            nowPlayingCollectionView.heightAnchor.constraint(equalToConstant: 380),
            nowPlayingCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: UIScreen.main.bounds.width - 16)
        ])
    }
}


extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == popularCollectionView ?  4 : 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == popularCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.POPULAR_IDENTIFIER, for: indexPath)
            cell.backgroundColor = .blue
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.NOW_PLAYING_IDENTIFIER, for: indexPath)
            cell.backgroundColor = .brown
            return cell
        }
    }
}
