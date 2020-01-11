//
//  TitleView.swift
//  LeagueStats
//
//  Created by Junyu Lin on 30/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class TitleView: UIView{
    let title: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.text = "Win"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let gameType: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.text = "Ranked Solo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let date: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.text = "| 2019.11.27 |"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let time: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.text = "28:28"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpViews(){
        addSubview(title)
        
        title.anchors(centerY: centerYAnchor, left: leftAnchor, leftConstant: 8, height: heightAnchor, heightValue: 0.8)
//        title.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
//        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        title.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        
        addSubview(time)
        
        time.anchors(centerY: centerYAnchor, right: rightAnchor, rightConstant: -8, height: heightAnchor, heightValue: 0.5)
//        time.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
//        time.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        time.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        
        addSubview(date)
        
        date.anchors(centerY: centerYAnchor, right: time.leftAnchor, rightConstant: -8, height: heightAnchor, heightValue: 0.8)
//        date.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
//        date.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        date.rightAnchor.constraint(equalTo: time.leftAnchor, constant: -8).isActive = true
        
        addSubview(gameType)
        
        gameType.anchors(centerY: centerYAnchor, right: date.leftAnchor, rightConstant: -8, height: heightAnchor, heightValue: 0.8)
//        gameType.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
//        gameType.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        gameType.rightAnchor.constraint(equalTo: date.leftAnchor, constant: -8).isActive = true
    }
}
