//
//  BottomRefresh.swift
//  LeagueStats
//
//  Created by Junyu Lin on 26/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class BottomRefresh: UICollectionViewCell{
    let indicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(indicator)
        
        indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
