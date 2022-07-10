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
    var upcomingCollectionView: UICollectionView!
    
    struct Constants {
        static let POPULAR_IDENTIFIER = "popular-view-cell"
        static let NOW_PLAYING_IDENTIFIER = "now-playing-view-cell"
        static let UPCOMING_IDENTIFIER = "upcoming-view-cell"
    }
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .red
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2220)
        return scroll
    }()
    
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
    
    private lazy var upcomingLabel: UILabel = {
        let label = UILabel()
        label.text = "Upcoming"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Featured"
        view.addSubview(scrollView)
        scrollView.addSubview(popularLabel)
        setupPopularCollectionView()
        scrollView.addSubview(popularLabel)
        scrollView.addSubview(nowPlayingLabel)
        setupNowPlayingCollectionView()
        scrollView.addSubview(upcomingLabel)
        setupUpcomingCollectionView()
        setupContraints()
    }
        
    private func setupPopularCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        layout.itemSize = CGSize(width: 200, height: 140)
        layout.scrollDirection = .horizontal
        
        popularCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.backgroundColor = .white
        popularCollectionView.showsVerticalScrollIndicator = false
        popularCollectionView.showsHorizontalScrollIndicator = false
        
        popularCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.POPULAR_IDENTIFIER)
        scrollView.addSubview(popularCollectionView)
    }
    
    private func setupNowPlayingCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: 251, height: 106)
        layout.scrollDirection = .horizontal
        
        nowPlayingCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        nowPlayingCollectionView.dataSource = self
        nowPlayingCollectionView.delegate = self
        nowPlayingCollectionView.backgroundColor = .yellow
        nowPlayingCollectionView.showsVerticalScrollIndicator = false
        nowPlayingCollectionView.showsHorizontalScrollIndicator = false
        
        nowPlayingCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.NOW_PLAYING_IDENTIFIER)
        scrollView.addSubview(nowPlayingCollectionView)
    }
    
    private func setupUpcomingCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: 200, height: 299)
        layout.scrollDirection = .horizontal
        
        upcomingCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        upcomingCollectionView.backgroundColor = .yellow
        upcomingCollectionView.showsVerticalScrollIndicator = false
        upcomingCollectionView.showsHorizontalScrollIndicator = false
        
        upcomingCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.UPCOMING_IDENTIFIER)
        scrollView.addSubview(upcomingCollectionView)
    }
        
    private func setupContraints(){
        scrollViewConstraints()
        popularLabelConstraints()
        popularCollectionConstraints()
        nowPlayingLabelConstraints()
        nowPlayingCollectionConstraints()
        upcomingLabelContraints()
        upcomingCollectionConstraints()
    }
    
    private func scrollViewConstraints(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: UIScreen.main.bounds.width),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func popularLabelConstraints(){
        NSLayoutConstraint.activate([
            popularLabel.topAnchor.constraint(equalTo: scrollView.topAnchor ),
            popularLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 8),
            popularLabel.rightAnchor.constraint(equalTo: scrollView.leftAnchor, constant: UIScreen.main.bounds.width - 16),
            popularLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func popularCollectionConstraints(){
        popularCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popularCollectionView.topAnchor.constraint(equalTo: popularLabel.bottomAnchor),
            popularCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            popularCollectionView.heightAnchor.constraint(equalToConstant: 200),
            popularCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: UIScreen.main.bounds.width - 16)
        ])
    }
    
    private func nowPlayingLabelConstraints(){
        NSLayoutConstraint.activate([
            nowPlayingLabel.topAnchor.constraint(equalTo: popularCollectionView.bottomAnchor),
            nowPlayingLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 8),
            nowPlayingLabel.rightAnchor.constraint(equalTo: scrollView.leftAnchor, constant: UIScreen.main.bounds.width - 16),
            nowPlayingLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func nowPlayingCollectionConstraints(){
        nowPlayingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nowPlayingCollectionView.topAnchor.constraint(equalTo: nowPlayingLabel.bottomAnchor),
            nowPlayingCollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            nowPlayingCollectionView.heightAnchor.constraint(equalToConstant: 380),
            nowPlayingCollectionView.rightAnchor.constraint(equalTo: scrollView.leftAnchor, constant: UIScreen.main.bounds.width - 16)
        ])
    }
    
    private func upcomingLabelContraints(){
        NSLayoutConstraint.activate([
            upcomingLabel.topAnchor.constraint(equalTo: nowPlayingCollectionView.bottomAnchor, constant: 16),
            upcomingLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 8),
            upcomingLabel.rightAnchor.constraint(equalTo: scrollView.leftAnchor, constant: UIScreen.main.bounds.width - 16),
            upcomingLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func upcomingCollectionConstraints(){
        upcomingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upcomingCollectionView.topAnchor.constraint(equalTo: upcomingLabel.bottomAnchor),
            upcomingCollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            upcomingCollectionView.heightAnchor.constraint(equalToConstant: 340),
            upcomingCollectionView.rightAnchor.constraint(equalTo: scrollView.leftAnchor, constant: UIScreen.main.bounds.width - 16)
        ])
        
    }
}


extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView {
            return 4
        }
        
        if collectionView == nowPlayingCollectionView {
            return 4
        }
        
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var identifier = ""
        if collectionView == popularCollectionView {
            identifier = Constants.POPULAR_IDENTIFIER
        }
        
        if collectionView == nowPlayingCollectionView {
            identifier = Constants.NOW_PLAYING_IDENTIFIER
        }
        
        if collectionView == upcomingCollectionView {
            identifier = Constants.UPCOMING_IDENTIFIER
        }
        
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
}
