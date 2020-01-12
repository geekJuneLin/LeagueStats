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
        
        addSubview(time)
        
        time.anchors(centerY: centerYAnchor, right: rightAnchor, rightConstant: -8, height: heightAnchor, heightValue: 0.5)
        
        addSubview(date)
        
        date.anchors(centerY: centerYAnchor, right: time.leftAnchor, rightConstant: -8, height: heightAnchor, heightValue: 0.8)
        
        addSubview(gameType)
        
        gameType.anchors(centerY: centerYAnchor, right: date.leftAnchor, rightConstant: -8, height: heightAnchor, heightValue: 0.8)
    }
}
