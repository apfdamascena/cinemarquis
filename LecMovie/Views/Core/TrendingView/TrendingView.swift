//
//  TrendingView.swift
//  LecMovie
//
//  Created by alexdamascena on 19/07/22.
//

import UIKit

class TrendingView: UIView {
    
    struct Constants {
        static let cellHeight: CGFloat = 114
    }
    
    var segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Today", "This Week"])
        return segmented
    }()
    
    var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = Constants.cellHeight
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
        segmentedControl.addTarget(self,
                                   action: #selector(didTapSegmentedControl(_:)),
                                   for: .valueChanged)
    }
    
    @objc func didTapSegmentedControl(_ sender: UISegmentedControl){
        print("oi")
    }
    
    private func addSubviews(){
        self.addSubview(segmentedControl)
        self.addSubview(tableView)
    }
    
    private func setupConstraints(){
        segmentedControlConstraints()
        tableViewConstraints()
    }
}

extension TrendingView {
    
    func segmentedControlConstraints(){
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            segmentedControl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 11.5),
            segmentedControl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -11.5),
            segmentedControl.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    func tableViewConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    
}
