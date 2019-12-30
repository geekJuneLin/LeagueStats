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
        //title.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        title.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        
        addSubview(time)
        //time.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        time.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        time.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        time.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        
        addSubview(date)
        //date.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        date.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        date.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        date.rightAnchor.constraint(equalTo: time.leftAnchor, constant: -8).isActive = true
        
        addSubview(gameType)
        //gameType.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        gameType.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        gameType.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        gameType.rightAnchor.constraint(equalTo: date.leftAnchor, constant: -8).isActive = true
    }
}
