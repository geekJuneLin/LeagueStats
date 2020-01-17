//
//  ServerCollectionViewCell.swift
//  LeagueStats
//
//  Created by Junyu Lin on 17/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

class ServerCollectionViewCell: UICollectionViewCell{
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let saperator: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpViews(){
        addSubview(nameLabel)
        nameLabel.anchors(centerX: centerXAnchor, centerY: centerYAnchor)
        
        addSubview(saperator)
        saperator.anchors(bottom: bottomAnchor, width: widthAnchor, widthValue: 1, heightValue: 0.8)
    }
}
