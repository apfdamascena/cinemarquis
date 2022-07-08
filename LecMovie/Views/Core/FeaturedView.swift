//
//  FeaturedView.swift
//  LecMovie
//
//  Created by alexdamascena on 07/07/22.
//

import UIKit

class FeaturedView: UIView {
    
    
    enum Constants {
        static let POPULAR_CELL_IDENTIFIER = "cell-popular"
    }
    
    private lazy var popularLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.backgroundColor = .yellow
        return label
    }()
        
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        setupViews()
        setupContraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupViews() {
        self.addSubview(popularLabel)
    }
    
    private func setupContraints(){
        self.translatesAutoresizingMaskIntoConstraints = false
        popularLabelConstraints()
    }
    
    private func popularLabelConstraints(){
        popularLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popularLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            popularLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 8),
            popularLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: UIScreen.main.bounds.width - 16),
            popularLabel.heightAnchor.constraint(equalToConstant: 41)
        ])
    }
}
