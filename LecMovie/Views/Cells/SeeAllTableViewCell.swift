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
        label.textColor = UIColor(named: Constants.SUBTEXT)
        return label
    }()
    
    var ratingView: UIView = {
       let view = UIView()
       return view
    }()
    
    var star: UIImageView = {
        let view = UIImageView()
        view.tintColor = UIColor(named: Constants.THIRD)
        view.image = UIImage(systemName: "star.fill")
        return view
    }()
    
    var ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: Constants.THIRD)
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(named: Constants.SECONDARY)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        self.backgroundColor = UIColor(named: Constants.PRIMARY)
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
        titleSeeAll.text = movie.title
        star.tintColor = .black
        ratingLabel.text = "\(movie.voteAverage)"
        dateLabel.text = movie.releaseDate
        
        Task {
            let data = await APICaller.downloadImageData(withPath: movie.posterPath)
            let image = UIImage(data: data)
            imageSeeAll.image = image
        }
    }

}
