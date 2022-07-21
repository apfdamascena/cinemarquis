//
//  TrendingViewController.swift
//  LecMovie
//
//  Created by alexdamascena on 17/07/22.
//

import UIKit

class TrendingViewController: UIViewController {
    
    let trendingView: TrendingView = TrendingView()
    
    var movies: [TrendingMovie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = trendingView
        trendingView.tableView.dataSource = self
        trendingView.delegate = self
        trendingView.tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.trendingIdentifier)
        title = "Trending"
        
        navigationController?.navigationBar.barTintColor = UIColor(named: Constants.PRIMARY)
        
        getAllData(with: "day")
        setupColors()
    }
    
    private func setupColors(){
        navigationController?.navigationBar.barTintColor = UIColor(named: Constants.PRIMARY)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: Constants.TEXT) ?? .black]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor(named: Constants.TEXT) ?? .black]
    }
    
    private func getAllData(with time_window: String){
        Task {
            let data = await APICaller.shared.makeRequest(with: Endpoint(path: "/3/trending/movie/\(time_window)", queryItems: []),
                                                          expecting: TrendingMovieResponse.self)
            guard let movies = try? data.get() else { return }
            self.movies = movies.results
            self.trendingView.tableView.reloadData()
        }
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

extension TrendingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("oi")
    }
}


extension TrendingViewController: TrendingViewProtocol {
    
    func updateData(with timeWindow: String) {
        getAllData(with: timeWindow)
    }
}
