//
//  SeeAllViewController.swift
//  LecMovie
//
//  Created by alexdamascena on 19/07/22.
//

import UIKit

class SeeAllViewController: UIViewController {

    var seeAllTitle: String?
    var movies: [Movie] = []
    var isNowPlaying: Bool?
    let seeAllView = SeeAllView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        guard let seeAllTitle = seeAllTitle else { return }
        
        title = seeAllTitle
        self.view = seeAllView
        seeAllView.tableView.dataSource = self
        seeAllView.tableView.delegate = self
        
        getAllData()
    }
    
    func getAllData(){
        guard let isNowPlaying = isNowPlaying else { return }
        let route = isNowPlaying == true ? "/3/movie/now_playing" : "/3/movie/upcoming"
        
        Task {
            let data = await APICaller.shared.makeRequest(with: Endpoint(path: route, queryItems: []),
                                         expecting: MovieResponse.self)
            if let movies = try? data.get() {
                self.movies = movies.results
                self.seeAllView.tableView.reloadData()
            }
        }
    }
}


extension SeeAllViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SeeAllTableViewCell.identifier, for: indexPath) as? SeeAllTableViewCell else { return UITableViewCell() }
        let index = indexPath.row
        let movie = movies[index]
        cell.draw(movie)
        return cell
    }
}

extension SeeAllViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.item
        let movie = movies[index]
        let detailsViewController = DetailsViewController()
        detailsViewController.movie = movie
        self.navigationController?.pushViewController(detailsViewController, animated: false)
    }
}
