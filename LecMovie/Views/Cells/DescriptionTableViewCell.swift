//
//  DescriptionTableViewCell.swift
//  LecMovie
//
//  Created by alexdamascena on 19/07/22.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    static let trendingIdentifier = "TredingTableViewCell"
    static let searchIdentifier = "SearchTableViewCell"
    
    var imageDescription: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var titleDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: Constants.SUBTEXT)
        return label
    }()
    
    var arrowRight: UIImageView = {
        let view = UIImageView()
        view.tintColor = UIColor(named: Constants.THIRD)
        return view
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(named: Constants.SECONDARY)
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
        self.backgroundColor = UIColor(named: Constants.PRIMARY)
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
    
    func draw(_ movie: TrendingMovie){
        imageDescription.image = UIImage()
        arrowRight.image = UIImage(systemName: "chevron.right")
        titleDescription.text = movie.title
        dateLabel.text = DateHandler.shared.getYear(of: movie.releaseDate)
        
        guard let path = movie.posterPath else { return }
        
        Task {
            let data = await APICaller.downloadImageData(withPath: path)
            let image = UIImage(data: data)
            imageDescription.image = image
        }
    }
    
    func draw(_ movie: SearchMovie){
        arrowRight.image = UIImage(systemName: "chevron.right")
        titleDescription.text = movie.name
        dateLabel.text = ""
        
        Task {
            
            let data = await APICaller.shared.makeRequest(with: Endpoint(path: "/3/movie/\(movie.id)", queryItems: []),
                                         expecting: DetailsMovie.self)
            guard let movie = try? data.get() else { return }
            guard let path = movie.posterPath else { return }
            
            let dataImage = await APICaller.downloadImageData(withPath: path)
            let image = UIImage(data: dataImage)
            imageDescription.image = image
        }
    }
}

