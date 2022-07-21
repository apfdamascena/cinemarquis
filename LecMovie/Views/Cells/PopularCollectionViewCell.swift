//
//  PopularCollectionViewCell.swift
//  LecMovie
//
//  Created by alexdamascena on 07/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PopularCollectionViewCell"
    
    var popularImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    var popularTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: Constants.SUBTEXT)
        return label
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
    
    private func addSubviews(){
        contentView.addSubview(popularImage)
        contentView.addSubview(popularTitle)
    }
    
    private func setupContraints(){
        popularImageConstraints()
        popularTitleConstraints()
    }
    
    
    func draw(_ movie: Movie) {
        popularTitle.text = movie.title
        
        Task {
            let data = await APICaller.downloadImageData(withPath: movie.posterPath)
            let image = UIImage(data: data)
            popularImage.image = image
        }
    }
}

