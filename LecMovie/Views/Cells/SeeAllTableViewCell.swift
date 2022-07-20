//
//  SeeAllTableViewCell.swift
//  LecMovie
//
//  Created by alexdamascena on 19/07/22.
//

import UIKit

class SeeAllTableViewCell: UITableViewCell {
    
    
    static let identifier = "SeeAllTableViewCell"
    
    var imageSeeAll: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var titleAndRatingStack: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    var titleSeeAll: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    var ratingView: UIView = {
       let view = UIView()
       return view
    }()
    
    var star: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    var ratingLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(named: "subtitle")
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews(){
        contentView.addSubview(imageSeeAll)
        contentView.addSubview(titleAndRatingStack)
        titleAndRatingStack.addSubview(titleSeeAll)
        titleAndRatingStack.addSubview(star)
        titleAndRatingStack.addSubview(ratingLabel)
        contentView.addSubview(titleAndRatingStack)
        contentView.addSubview(dateLabel)
    }
    
    private func setupConstraints(){
        imageSeeAllConstraints()
        titleAndRatingStackConstraints()
        titleSeeAllContraints()
        starConstraints()
        ratingLabelConstraints()
        dateLabelConstraints()
    }
    
    
    func draw(_ movie: Movie){
        imageSeeAll.image = UIImage(named: movie.poster)
        titleSeeAll.text = movie.title
        star.image = UIImage(systemName: "star.fill")
        star.tintColor = .black
        ratingLabel.text = "8.2"
        dateLabel.text = movie.releaseDate
    }

}
