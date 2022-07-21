//
//  FeaturedView.swift
//  LecMovie
//
//  Created by alexdamascena on 07/07/22.
//

import UIKit


class FeaturedView: UIView {
    
    weak var delegate: FeaturedViewProtocol?
        
    var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: 390, height: 1040)
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
        
    var popularCollectionView: FeaturedCollectionView = {
        let collection = FeaturedCollectionView()
        let itemSize = CellSize(width: 200, height: 140)
        let viewModel = FeaturedCollectionViewModel(identifier: PopularCollectionViewCell.identifier,
                                                    cell: PopularCollectionViewCell.self,
                                                    cellSize: itemSize)
        collection.configure(with: viewModel)
        return collection
    }()
    
    var nowPlayingCollectionView: FeaturedCollectionView = {
        let collection = FeaturedCollectionView()
        let itemSize = CellSize(width: 251, height: 114)
        let viewModel = FeaturedCollectionViewModel(identifier: NowPlayingCollectionViewCell.identifier,
                                                    cell: NowPlayingCollectionViewCell.self,
                                                    cellSize: itemSize)
        collection.configure(with: viewModel)
        return collection
    }()
    
    var upcommingCollectionView: FeaturedCollectionView = {
        let collection = FeaturedCollectionView()
        let itemSize = CellSize(width: 200, height: 299)
        let viewModel = FeaturedCollectionViewModel(identifier: UpcomingCollectionViewCell.identifier,
                                                    cell: UpcomingCollectionViewCell.self,
                                                    cellSize: itemSize)
        collection.configure(with: viewModel)
        return collection
    }()
    
    var popularLabel: TitleLabel = {
        let label = TitleLabel()
        label.configure(with: TitleLabelViewModel(title: "Popular"))
        return label
    }()
    
    var nowPlayingLabel: TitleLabel = {
        let label = TitleLabel()
        label.configure(with: TitleLabelViewModel(title: "Now Playing"))
        return label
    }()
    
      var upcomingLabel: TitleLabel = {
         let label = TitleLabel()
         label.configure(with: TitleLabelViewModel(title: "Upcoming"))
         return label
    }()
    
    var seeAllNowPlayingButton: SeeAll = {
        let button  = SeeAll()
        return button
    }()
    
    var seeAllUpcomingButton: SeeAll = {
        let button = SeeAll()
        return button
    }()
    
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewColors()
        addSubviews()
        configureConstraints()
        configureButtons()
    }
    
    private func setupViewColors(){
        self.backgroundColor = UIColor(named: Constants.PRIMARY)
    }
    
    private func configureButtons(){
        seeAllNowPlayingButton.addTarget(self, action: #selector(didTapSeeAllNowPlayingButton), for: .touchUpInside)
        seeAllUpcomingButton.addTarget(self, action: #selector(didTapSeeAllUpcomingButton), for: .touchUpInside)
    }
    
    @objc func didTapSeeAllNowPlayingButton(sender: UIButton) {
        delegate?.showAllNowPlaying()
    }
    
    @objc func didTapSeeAllUpcomingButton(sender: UIButton) {
        delegate?.showAllUpcoming()
    }
    
    
    private func addSubviews(){
        self.addSubview(scrollView)
        scrollView.addSubview(popularLabel)
        scrollView.addSubview(popularCollectionView)
        scrollView.addSubview(nowPlayingLabel)
        scrollView.addSubview(nowPlayingCollectionView)
        scrollView.addSubview(upcomingLabel)
        scrollView.addSubview(upcommingCollectionView)
        scrollView.addSubview(seeAllNowPlayingButton)
        scrollView.addSubview(seeAllUpcomingButton)
    }
    
    private func configureConstraints(){
        scrollViewConstraints()
        popularLabelContraints()
        popularCollectionViewConstraints()
        seeAllNowPlayingButtonConstraints()
        nowPlayingLabelConstraints()
        nowPlayingCollectionViewConstraints()
        upcomingLabelConstraints()
        seeAllUpcomingButtonConstraints()
        upcommingCollectionViewConstraints()
    }
}
