//
//  SearchViewController.swift
//  LecMovie
//
//  Created by alexdamascena on 17/07/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchBarController = UISearchController()
    
    var movies: [SearchMovie] = []
        
    var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 114
        table.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.searchIdentifier)
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(named: Constants.PRIMARY)
        return table
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        title = "Search Movies"
        self.view.backgroundColor = UIColor(named: Constants.PRIMARY)
        navigationItem.searchController = searchBarController
        searchBarController.searchResultsUpdater = self
        tableView.dataSource = self
        view.addSubview(tableView)
        setupColors()
        setupConstraints()
    }
    
    private func setupColors(){
        navigationController?.navigationBar.barTintColor = UIColor(named: Constants.PRIMARY)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: Constants.TEXT) ?? .black]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor(named: Constants.TEXT) ?? .black]
    }
    
    private func setupConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }
    
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        guard let textConverted = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        Task {
            let data = await APICaller.shared.makeRequest(with: Endpoint(path: "/3/search/company", queryItems: [
                URLQueryItem(name: "query", value: textConverted)
            ]), expecting: SearchMovieResponse.self)
            guard let movies = try? data.get() else { return }
            guard let result = movies.results else { return }
            self.movies = result
            self.tableView.reloadData()
        }
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.item]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.searchIdentifier, for: indexPath) as? DescriptionTableViewCell else { return UITableViewCell() }
        cell.draw(movie)
        return cell
    }
}
