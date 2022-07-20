//
//  UpcomingCollectionViewCell.swift
//  LecMovie
//
//  Created by alexdamascena on 18/07/22.
//

import UIKit


class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "UpcomingCollectionViewCell"
    
    var upcomingImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    var upcomingTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(named: "upcomingTitle")
        return label
    }()
    
    var upcomingDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(named: "subtitle")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews(){
        contentView.addSubview(upcomingImage)
        contentView.addSubview(upcomingTitle)
        contentView.addSubview(upcomingDate)
    }
    
    func draw(_ movie: Movie){
        upcomingImage.image = UIImage(named: movie.poster)
        upcomingTitle.text = movie.title
        upcomingDate.text = DateHandler.shared.getYear(of: movie.releaseDate)
    }
    
    private func setupContraints(){
        upcomingImageConstraints()
        upcomingDateConstraints()
        upcomingTitleConstraints()
    }
}
