//
//  SearchButtonAboveKB.swift
//  LeagueStats
//
//  Created by Junyu Lin on 8/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

class SearcheButtonAboveKB: UIView{
    
    let searchLabel: UILabel = {
       let label = UILabel()
        label.text = "SEARCH"
        label.textAlignment = .center
        label.textColor = .winColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
        addSubview(searchLabel)
        
        searchLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        searchLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        searchLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        searchLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
    }
}
