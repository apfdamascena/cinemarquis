//
//  DetailsViewController.swift
//  LecMovie
//
//  Created by alexdamascena on 18/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Movie?
    
    var backdropImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    var detailsDescription: DetailsDescription = {
       let description = DetailsDescription()
       return description
    }()
    
    var overviewTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.text = "Overview"
        label.textColor = UIColor(named: Constants.SUBTEXT)
        return label
    }()
    
    var overviewText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.sizeToFit()
        label.textColor = UIColor(named: Constants.SUBTEXT)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        guard let movie = movie else { return }
        title = movie.title
        addSubviews()
        setupContraints()
        

        detailsDescription.delegate = self
        
        detailsDescription.draw(movie)
        
        setup()
        self.view.backgroundColor = UIColor(named: Constants.PRIMARY)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(touchInsideBackdrop))
        backdropImage.addGestureRecognizer(gesture)
        backdropImage.isUserInteractionEnabled = true
    }
    
    private func setup(){
        guard let movie = movie else { return }
        
        Task {
            let data = await APICaller.downloadImageData(withPath: movie.backdropPath)
            let image = UIImage(data: data)
            backdropImage.image = image
        }
        
        overviewText.text = movie.overview
    }
    
    
    private func addSubviews(){
        view.addSubview(backdropImage)
        view.addSubview(detailsDescription)
        view.addSubview(overviewTitle)
        view.addSubview(overviewText)
    }
    
    private func setupContraints(){
        backDropImageConstraints()
        detailsDescriptionConstraints()
        overviewTitleConstraints()
        overviewTextConstraints()
    }
    
    @objc func touchInsideBackdrop(sender: UIButton) {
        self.touchInImage()
    }
}

extension DetailsViewController: DetailsViewProtocol {
    
    func touchInImage() {
        let imageViewController = ImageViewController()
        guard let movie = movie else { return }
        imageViewController.configure(with: movie)
        self.navigationController?.pushViewController(imageViewController, animated: false)
    }
}



