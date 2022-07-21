//
//  ImageViewController.swift
//  LecMovie
//
//  Created by alexdamascena on 18/07/22.

import UIKit

class ImageViewController: UIViewController {

    private var imagePoster: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = "Official Poster"

                
        addSubviews()
        setupConstraints()
        setupColors()
    }
    
    private func setupColors(){
        self.view.backgroundColor = UIColor(named: Constants.PRIMARY)
        navigationController?.navigationBar.barTintColor = UIColor(named: Constants.PRIMARY)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: Constants.TEXT) ?? .black]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor(named: Constants.TEXT) ?? .black]
    }

    
    private func addSubviews(){
        view.addSubview(imagePoster)
    }
    
    private func setupConstraints(){
        imagePoster.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagePoster.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imagePoster.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            imagePoster.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            imagePoster.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
    }
    
    func configure(with movie: Movie){
        Task {
            let data = await APICaller.downloadImageData(withPath: movie.posterPath)
            let image = UIImage(data: data)
            imagePoster.image = image
        }
    }
}
