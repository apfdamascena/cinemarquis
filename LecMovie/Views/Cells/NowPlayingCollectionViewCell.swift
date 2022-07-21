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
        label.textColor = UIColor(named: Constants.SUBTEXT)
       return label
    }()
    
    var nowPlayingSubtitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: Constants.SECONDARY)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    var borderBottom: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Constants.SUBTEXT)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupContraints()
        self.backgroundColor = UIColor(named: Constants.PRIMARY)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func draw(_ movie: Movie){
        nowPlayingTitle.text = movie.title
        nowPlayingSubtitle.text = DateHandler.shared.getYear(of: movie.releaseDate)
        
        Task {
            let data = await APICaller.downloadImageData(withPath: movie.posterPath)
            let image = UIImage(data: data)
            nowPlayingImage.image = image
        }
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


