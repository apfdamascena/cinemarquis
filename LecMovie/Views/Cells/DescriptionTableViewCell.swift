//
//  DescriptionTableViewCell.swift
//  LecMovie
//
//  Created by alexdamascena on 19/07/22.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    static let trendingIdentifier = "TredingTableViewCell"
    
    var imageDescription: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var titleDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    var arrowRight: UIImageView = {
        let view = UIImageView()
        view.tintColor = .black
        return view
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(named: "subtitle")
        return label
    }()
    
    var dateArrowStack: UIStackView = {
       let stack = UIStackView()
       return stack
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews(){
        contentView.addSubview(imageDescription)
        contentView.addSubview(titleDescription)
        dateArrowStack.addSubview(dateLabel)
        dateArrowStack.addSubview(arrowRight)
        contentView.addSubview(dateArrowStack)
    }
    
    private func setupConstraints(){
        imageDescriptionConstraints()
        titleDescriptionConstraints()
        dateArrowStackConstraints()
        dateLabelConstraints()
        arrowRightConstraints()
    }
    
    func draw(_ movie: Movie){
        imageDescription.image = UIImage(named: movie.poster)
        arrowRight.image = UIImage(systemName: "chevron.right")
        titleDescription.text = "Spider-Man"
        dateLabel.text = "2002"
    }
}

