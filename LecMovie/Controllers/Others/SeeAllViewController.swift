//
//  SeeAllViewController.swift
//  LecMovie
//
//  Created by alexdamascena on 19/07/22.
//

import UIKit

class SeeAllViewController: UIViewController {

    var seeAllTitle: String?
    var movies: [Movie]?
    
    let seeAllView = SeeAllView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        guard let seeAllTitle = seeAllTitle else { return }
        guard let movies = movies else { return }
        
        title = seeAllTitle
        self.view = seeAllView
        seeAllView.tableView.dataSource = self
        seeAllView.tableView.delegate = self
        self.movies = movies
    }
}


extension SeeAllViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movies = movies else { return 0 }
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SeeAllTableViewCell.identifier, for: indexPath) as? SeeAllTableViewCell else { return UITableViewCell() }
        guard let movies = movies else { return UITableViewCell() }
        let index = indexPath.row
        let movie = movies[index]
        cell.draw(movie)
        return cell
    }
}

extension SeeAllViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movies = movies else { return }
        let index = indexPath.item
        let movie = movies[index]
        let detailsViewController = DetailsViewController()
        detailsViewController.movie = movie
        self.navigationController?.pushViewController(detailsViewController, animated: false)
    }
}
