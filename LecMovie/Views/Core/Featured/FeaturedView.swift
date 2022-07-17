//
//  FeaturedView.swift
//  LecMovie
//
//  Created by alexdamascena on 07/07/22.
//

import UIKit


class FeaturedView: UIView {
    
    var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: 410, height: 2000)
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
        let viewModel = FeaturedCollectionViewModel(identifier: "teste2",
                                                    cell: UICollectionViewCell.self,
                                                    cellSize: itemSize)
        collection.configure(with: viewModel)
        return collection
    }()
    
    var upcommingCollectionView: FeaturedCollectionView = {
        let collection = FeaturedCollectionView()
        let itemSize = CellSize(width: 200, height: 299)
        let viewModel = FeaturedCollectionViewModel(identifier: "teste3",
                                                    cell: UICollectionViewCell.self,
                                                    cellSize: itemSize)
        collection.configure(with: viewModel)
        return collection
    }()
    
    var popularLabel: TitleLabel = {
        let label = TitleLabel.init()
        label.configure(with: TitleLabelViewModel(title: "Popular"))
        return label
    }()
    
    var nowPlayingLabel: TitleLabel = {
        let label = TitleLabel.init()
        label.configure(with: TitleLabelViewModel(title: "Now Playing"))
        return label
    }()
    
      var upcomingLabel: TitleLabel = {
         let label = TitleLabel.init()
         label.configure(with: TitleLabelViewModel(title: "Upcoming"))
         return label
    }()
            
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureConstraints()
    }
    
    private func addSubviews(){
        self.addSubview(scrollView)
        scrollView.addSubview(popularLabel)
        scrollView.addSubview(popularCollectionView)
        scrollView.addSubview(nowPlayingLabel)
        scrollView.addSubview(nowPlayingCollectionView)
        scrollView.addSubview(upcomingLabel)
        scrollView.addSubview(upcommingCollectionView)
    }
    
    private func configureConstraints(){
        scrollViewConstraints()
        popularLabelContraints()
        popularCollectionViewConstraints()
        nowPlayingLabelConstraints()
        nowPlayingCollectionViewConstraints()
        upcomingLabelConstraints()
        upcommingCollectionViewConstraints()
    }
}
