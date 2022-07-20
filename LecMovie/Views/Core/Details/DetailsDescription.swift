//
//  DetailsDescription.swift
//  LecMovie
//
//  Created by alexdamascena on 18/07/22.
//

import UIKit

class DetailsDescription: UIView {
    
    var titleMovie: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    var content: UIView = {
        let view = UIView()
        return view
    }()
    
    var imageContent: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    var star: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.tintColor = .black
        return image
    }()
    
    var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    var genreAndDurationView: UIView = {
        let view = UIView()
        return view
    }()
    
    var genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    var durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .right
        return label
    }()
    
    var borderBottom: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    weak var delegate: DetailsViewProtocol?
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(touchUpInside))
        imageContent.addGestureRecognizer(gesture)
        imageContent.isUserInteractionEnabled = true
    }
    
    private func addSubviews(){
        self.addSubview(titleMovie)

        content.addSubview(imageContent)
        content.addSubview(star)
        content.addSubview(ratingLabel)
        genreAndDurationView.addSubview(genreLabel)
        genreAndDurationView.addSubview(durationLabel)
        content.addSubview(genreAndDurationView)
        self.addSubview(content)
        self.addSubview(borderBottom)
    }
    
    private func setupConstraints(){
        titleMovieConstraints()
        contentConstraints()
        imageContentConstraints()
        starConstraints()
        ratingLabelConstraints()
        genreAndDurationViewConstraints()
        genreLabelConstraints()
        durationLabelConstraints()
        borderBottomConstraints()
    }
    
    @objc func touchUpInside(sender: UIButton) {
        delegate?.touchInImage()
    }
    
    func draw(_ movie: Movie){
        Task {
            let data = await APICaller.downloadImageData(withPath: movie.posterPath)
            let image = UIImage(data: data)
            imageContent.image = image
            
        }
        titleMovie.text = movie.title
        ratingLabel.text = "Rating \(movie.voteAverage)/10"
        genreLabel.text = "tesstando testando"
        durationLabel.text = "1h:30m"
    }
}


