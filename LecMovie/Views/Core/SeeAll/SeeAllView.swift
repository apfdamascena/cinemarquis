//
//  SeeAllView.swift
//  LecMovie
//
//  Created by alexdamascena on 19/07/22.
//

import UIKit

class SeeAllView: UIView {
    
    struct Constants {
        static let cellHeight: CGFloat = 114
    }
    
    var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = Constants.cellHeight
        table.register(SeeAllTableViewCell.self, forCellReuseIdentifier: SeeAllTableViewCell.identifier)
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews(){
        self.addSubview(tableView)
    }
    
    private func setupConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor)
        ])
    }

}
