//
//  TrendingViewController.swift
//  LecMovie
//
//  Created by alexdamascena on 17/07/22.
//

import UIKit

class TrendingViewController: UIViewController {
    
    let trendingView: TrendingView = TrendingView()
    
    var movies: [Movie] = [Movie(
        title: "Doctor Strange in the Multiverse of Madness",
        poster: "9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg",
        backdrop: "wcKFYIiVDvRURrzglV9kGu7fpfY.jpg",
        voteAverage: 7.5,
        releaseDate: "2022-05-04",
        overview: "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        genres: [ "Fantasy", "Action", "Adventure"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = trendingView
        trendingView.tableView.dataSource = self
        trendingView.tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.trendingIdentifier)
        title = "Trending"
    }
}

extension TrendingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.trendingIdentifier, for: indexPath) as? DescriptionTableViewCell else { return UITableViewCell() }
        let index = indexPath.row
        let movie = movies[index]
        cell.draw(movie)
        return cell
    }
}
