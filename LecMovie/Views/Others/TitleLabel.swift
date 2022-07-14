//
//  TitleLabel.swift
//  LecMovie
//
//  Created by alexdamascena on 12/07/22.
//

import UIKit


class TitleLabel: UILabel {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel(){
        self.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension TitleLabel {
    
    func configure(with viewModel: TitleLabelViewModel){
        self.text = viewModel.title
    }
}
