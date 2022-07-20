//
//  SeeAll.swift
//  LecMovie
//
//  Created by alexdamascena on 19/07/22.
//

import UIKit

class SeeAll: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(){
        self.setTitle("See all", for: .normal)
        self.setTitleColor(.red, for: .normal)
    }
}


