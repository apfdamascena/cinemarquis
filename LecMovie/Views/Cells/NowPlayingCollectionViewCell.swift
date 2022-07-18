//
//  NowPlayingCollectionViewCell.swift
//  LecMovie
//
//  Created by alexdamascena on 17/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NowPlayingCollectionViewCell"
    
    var nowPlayingImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    var nowPlayingTitle: UILabel = {
       let label = UILabel()
       label.lineBreakMode = .byWordWrapping
       label.numberOfLines = 2
       label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
       return label
    }()
    
    var nowPlayingSubtitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "subtitle")
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    var borderBottom: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func draw(_ movie: Movie){
        nowPlayingImage.image = UIImage(named: movie.poster)
        nowPlayingTitle.text = movie.title
        nowPlayingSubtitle.text = movie.releaseDate
    }
    
    private func addSubviews(){
        contentView.addSubview(nowPlayingImage)
        contentView.addSubview(nowPlayingTitle)
        contentView.addSubview(nowPlayingSubtitle)
        contentView.addSubview(borderBottom)
    }
    
    private func setupContraints(){
        nowPlayingImageConstraints()
        nowPlayingTitleConstraints()
        nowPlayingSubtitleConstraints()
        borderBottomConstraints()
    }
}


