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
        
        searchLabel.anchors(centerX: centerXAnchor, XConstant: 0, centerY: centerYAnchor, width: widthAnchor, widthValue: 0.3, height: heightAnchor, heightValue: 1)
    }
}
